# docker-vcpe
Bunch of exploratory work on running a vCPE as a container. Based on OpenWRT.

## architecture

Using Docker, we create two network; one of LAN, one of WAN access, and we instantiate a OpenWRT rootfs environement on it. This is a pretty much the baseline for a vCPE implementation running at the edge of the network.

## caveats

Openwrt has a lot of preinit stuff corresponding to the various boards it aims to support. A lot of work has to be carried out to alter /etc/preinit, /lib/preinit in order to have a functional and secure by default environement. 

## related work

There are several attempt at running the rootfs + init of openwrt in a Docker containers, but I found that one actually work great :
https://github.com/m-creations/docker-openwrt-x64/blob/master/Dockerfile
