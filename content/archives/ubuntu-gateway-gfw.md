+++
draft = true
date = "2017-05-03T09:24:47+08:00"
slug = ""
categories = ["Blog"]
title = "How to access to the internet"

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

So the first thing to do is getting a machine. 
I bought this one from Taobao, 928 CNY.

<!-- TODO --> Insert an image here

It has 4 ethernet ports. Of cause, no fans, super quiet.

What we are going to do is setup this machine as a software router, then use it as the gateway of the local network.
So we have to install a linux on it.
I installed Ubuntu 16.04 server.

You can use one of them to connect to the upstream as wan and another one the connect to the orignal router's wan as lan.
If your upstream is the moderm from ADSL provider, you may need to setup pppoe first.


### Shadowsocks

Now we need to figure out how to bypass the GFW.
The most obvious option is [shadowsocks](https://github.com/shadowsocks/shadowsocks-libev).
Or you can write your own vpn program to do this with all the detail control.
I decide to use shadowsocks for these reasons:
1. It works stable enough currently.
2. It provides a transparent mode that supports both tcp and udp.
3. It's much easier than write a vpn by yourself (if you interest, here is a [post](//TODO) talking about how to do it).

Let's do it. Since I am a big fan of Docker, it must be containerized.

After you install Docker. Run this, it should automatically pull the image and start the container.
Follow the documentation of shadowsocks to understand what these arguments mean.
```
d
```

### GeoIP

For the second target. There are a lot of ways do this using the white/black list.
User specify which site they want to bypass the GFW or not by editing the list.
It works fine when you only have a few site need the bypass function.
But it becomes very hard to maintain for my situation.
I need it works for the whole local network.
Other people under the network may access arbitary site.

So I decide to use GeoIP. 


### Cleanup



Solution: In general, I am going to setup an Linux server as the gateway of the local network.
All devices in the network access the internet throught the gateway.

Then can I have the whole control of local network traffic.

Here is how I setup an Ubuntu server to work as the gateway of local network.

First, you need a pc with muiltple ethernet ports. I recommand the mini pc with intel x86 cpu
and no fans. Though you can use a ARM machine as long as you know what you are doing.

Then install the Ubuntu server. I chose 16.04.

Install docker and docker-compose.

Launch docker container of shadowsocks client.

Install xtables-addons.

Download and build ip set for `xt_geoip`.

Enable module `xt_geoip`.

Setup iptables for shadowsocks.

Install and execute `pppoeconf` if your ADSL provider is using pppoe.

Setup iptables for nat.

Create systemd services to load iptables rules after boot.
