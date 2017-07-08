+++
draft = false
date = "2017-07-08T21:48:47+08:00"
slug = ""
categories = ["Blog"]
title = "Customize Gateway"

+++

### Defination

Problem: How to access to the real internet without any awareness of GFW for all the devices within local network, like home and office?

To make it more clear, there is several things need to be done:

1. it should work for all devices within the local network
2. it's completely transparent. user don't need to do any setup.
3. bypass the GFW
4. it should bypass the GFW only when it need to. For example, we don't want to bypass GFW when access a website hosts in China.

Let's go through them one by one.

### Hardware and NAT

The first two can be consider together.

We need control all the network traffic go to internet so that we can do the bypass transparently.
So the only position where we can do this is the gateway of local network.
Almost all of the gateway at home is a router, many router have the ability to solve the problem.
But it will be much easier with an intel x86 machine.

So the first thing to do is getting a machine and make it works as a gateway.

I bought this one from Taobao. It costs 928 CNY.

- CPU: Intel J1900
- Mem: 2GB
- Storage: 16G SSD

![machine](/images/2017/07/gateway-machine.png)

I choose it because:

1. It has Intel 82583V as ethernet controller, which can be drived directly by linux kernel.
2. No fans in it. Super quiet.

You need to setup the network after installed linux. BTW, I use Ubuntu 16.04 server.
How to configure is depends on the network environment you have.

In my case, I use one of ethernet ports to connect to the ADSL provider's moderm as WAN.
And another one the connect to the orignal router's WAN as LAN.

##### Setup the LAN static ip address:

```
cat << EOF > /etc/network/interfaces
auto enp3s0
iface enp3s0 inet static
address 192.168.1.1
netmask 255.255.255.0
EOF
```

##### Configure pppoe:

```bash
sudo apt install pppoeconf
pppoeconf
```

##### Setup NAT:

```bash
sudo iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
sudo iptables -A FORWARD -i ppp0 -o enp3s0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i enp3s0 -o ppp0 -j ACCEPT
```

Check if the network is working. Then we can continue.

### Shadowsocks

Now we need to figure out how to bypass the GFW.
The most obvious option is [shadowsocks](https://github.com/shadowsocks/shadowsocks-libev).
Or you can write your own vpn program to do this with all the detail control.

I decide to use shadowsocks for these reasons:

1. It works stable enough currently.
2. It provides a transparent mode that supports both tcp and udp.
3. It's much easier than write a vpn by yourself (if you interest, here is a [post](/archives/myvpn/) talking about how to do it).

Since I am a big fan of Docker, it must run in a container ;)

Install both docker and docker-compose.
Then `mkdir shadowsocks && cd shadowsocks` and create a new file `docker-compose.yml` with these content:

```
redir:
  image: easypi/shadowsocks-libev
  net: host
  restart: always
  log_opt:
    max-size: "30m"
  command:
    ss-redir -s <server_address>
             -p 18883
             -m rc4-md5
             -k secret
             -b 0.0.0.0
             -l 1080
             -t 60
             --fast-open
             -u
             -v
```

Remember to replace `<server_address>` with yours. Then run `cd shadowsocks && docker-compose up -d`.

Congratulations! Now you have exposed the shadowsocks service to the whole internet.

Don't worry. Let's drop all the packets from the WAN to port 1080.

```bash
iptables -A INPUT -i ppp0 -p tcp --dport 1080 -j DROP
iptables -A INPUT -i ppp0 -p udp --dport 1080 -j DROP
```

So far, all the tcp/udp packets send to port 1080 will be bypass the GFW. To make it transparent,
follow this [doc](https://github.com/shadowsocks/shadowsocks-libev#advanced-usage)

### GeoIP

There are a lot of ways to do the auto bypass. Many people using the simple white/black list.
In that case user specify which site they want to bypass the GFW or not by editing the list.
It works fine when you only have a few site need the bypass function.
But it becomes very hard to maintain the list for my situation.
I need it works for the whole local network.
Other people under the network may access arbitary site.

GeoIP is a better way to do this.
So that we need to install kernel module `xt_geoip`
which allow iptables specify rules base on the [ip database](https://www.maxmind.com/en/home).

```bash
sudo apt install xtables-addons-common

mkdir geoip
cd geoip
/usr/lib/xtables-addons/xt_geoip_dl # download ips csv file to current directory
unzip GeoIPCountryCSV.zip

sudo apt install libtext-csv-xs-perl
sudo mkdir /usr/share/xt_geoip # xt_geoip will use this directory as default
sudo /usr/lib/xtables-addons/xt_geoip_build -D /usr/share/xt_geoip *.csv # build binary ip db that xt_geoip can read

sudo modprobe xt_geoip
```

```
# Insert this rule before the tcp redirect rule:
iptables -t nat -A SHADOWSOCKS -m geoip --destination-country CN -j RETURN
```

At this point, the gateway should behavior as we expect. But there is a last thing to do.

### Cleanup

If you reboot the machine, all settings above will missing.
We have to make them as the systemd service.
Make them run once time when system boot.

I already save my config on [github](https://github.com/cirias/gateway-config).
Check out it.
