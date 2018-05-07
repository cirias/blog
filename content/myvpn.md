---
date: 2016-01-19T21:32:49+08:00
draft: false
title: 做一个自己的VPN
---

虽然现在有不少针对http的代理，但是还有很多工具使用其他的协议。例如，[mosh](https://mosh.mit.edu/)。
这些工具并不能利用现有的针对http的解决方案。除此之外，很多使用http协议的工具本身并不支持代理配置，
此时就要借助[proxychains](https://github.com/rofl0r/proxychains-ng)这样的工具，很不方便。

__所以，自己动手做一个[vpn](https://en.wikipedia.org/wiki/Virtual_private_network)吧！__

先来解释下什么是tuntap：

![tuntap](/images/2016/01/tuntap.svg)

tun是Linux内核中实现的位于三层的虚拟网络接口，它就像一个eth，可以接收用户应用程序发出的网络数据，
但是它不像eth另一头接着物理设备，而是用户程序。用户程序获取数据后再另外通过eth发送。
它与eth的另一区别是，eth工作在二层，tun工作在三层，也就是说tun只能处理IP协议的数据。

---

![topology](/images/2016/01/vpn-topology.svg)

接下来看下拓扑图，我们希望实现这样一个网络。其中，pc1和pc2是客户端，分别与s1建立连接，构成我们的私有网络。
s1担任这个网络的内部路由和通向外网的网关。

以ping来说明整个vpn的工作方式。先来说内部通信：`10.0.0.2 <-> 10.0.0.3`。在pc1执行：

```bash
ping 10.0.0.3
```

数据由ping程序生成后，通过tun0进入vpn客户端程序。vpn客户端程序从tun0读取每一个包，加密后，
再用四层协议（udp或tcp）发送到服务器。

s1服务器收到包后，先解密，然后从包头中读取出目标地址。发现目标地址匹配vpn网络掩码，于是根据目标地址，找到对应的客户端地址
和端口，再把包按该客户端的密钥加密后，发送到客户端。

pc2收到包后，还是先解密，之后直接发送到tun0。最后由TCP/IP协议栈接收，发送的响应包和之前一样回到pc1。

再来说下外部通信：`10.0.0.2 <-> 8.8.8.8`。在pc1执行：

```bash
ping 8.8.8.8
```

pc1上的流程和内部通信一样，区别在于s1服务器。服务器把包解密后，读取目标地址，发现与vpn子网掩码不匹配，于是直接发送
到tun0。经过TCP/IP协议栈后，包被送往目标地址。包回来的流程和之前也是一样的。

---

再来看看几个细节：

首先是通信协议。由于封装的是IP包，用tcp的话反而多此一举，选udp正合适。但是udp是无连接的，所以不能像tcp一样用连接来
区分客户端。这里要参考mosh，用不同的端口来区分客户端。即，每个客户端分别往服务器不同的端口发送数据。 服务器这边同
时监听多个端口，根据端口号来分辨客户端。

再来谈加密，加密算法就选择主流的AES。AES除了需要需要通信双方共享密钥之外，还需要[initialization vector](https://en.wikipedia.org/wiki/Initialization_vector)，
根据IV的作用，它不能够事先知道，必须每次都发送IV。这里顺便把发送的数据包的格式也确定下来：

```nil
+----------------------+
|    |  Encrypted Data |
| IV |-----------------|
|    |     Playload    |
|----+-----------------|
| 16 |     variable    |
+----------------------+
```

现在可以实现握手了，握手过程要解决一下几个问题：

1. 客户端认证：简单起见，使用预共享密钥。即，服务端和客户端事先都约定好一个密钥用于识别客户端。
2. 约定数据加密密钥：服务器生成
3. 约定udp端口：服务器分配

考虑到握手过程对可靠性有要求，故采用tcp协议。

最后完成客户端的路由及服务器的网络地址转换：

客户端

```bash
ip route add 10.0.0.0/24 dev tun0 # 这条是必须的
ip route add default dev tun0 # 这条配置默认路由

# 如果配置了默认路由，则一定要加上这条，不然会导致循环
ip route add <server ip> eth0
```

服务器

```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```
这条规则是给vpn的网关做上[NAT](https://en.wikipedia.org/wiki/Network_address_translation)。

---

这vpn的逻辑基本算是理清了，这里有一份[go语言的实现](https://github.com/cirias/myvpn)，给大家参考。
