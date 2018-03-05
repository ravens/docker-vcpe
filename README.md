# docker-vcpe
Bunch of exploratory work on running a vCPE as a container. Based on OpenWRT.

## architecture

Using Docker, we create two network; one of LAN, one of WAN access, and we instantiate a OpenWRT rootfs environement on it. This is a pretty much the baseline for a vCPE implementation running at the edge of the network.

## how to use

```
# first import a x86 rootfs from OpenWRT
docker import https://downloads.openwrt.org/releases/17.01.4/targets/x86/64/lede-17.01.4-x86-64-generic-rootfs.tar.gz openwrt:latest
# then build the network and the image
docker-compose up -d 
```

Web interface shoud be available as http://localhost:8080

## todos

* Add volumes as mentioned in the flash_keep section of the config/luci file.
* fix firewall
* fix WAN IP address
* fix LAN IP address gateway scheme. Impact of using IPAM as bootstrap, and then Luci to modify the IP address

## caveats

Openwrt has a lot of preinit stuff corresponding to the various boards it aims to support. A lot of work has to be carried out to alter /etc/preinit, /lib/preinit in order to have a functional and secure by default environement. 

## related work

There are several attempt at running the rootfs + init of openwrt in a Docker containers, but I found that one actually work great :
https://github.com/m-creations/docker-openwrt-x64/blob/master/Dockerfile
