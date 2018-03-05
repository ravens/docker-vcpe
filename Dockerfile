FROM openwrt:latest
MAINTAINER Yan Grunenberger <yan@grunenberger.net>

EXPOSE 80
EXPOSE 22

USER root

RUN mkdir /var/lock
RUN mkdir /var/run

# simplified version of https://github.com/m-creations/docker-openwrt-x64/blob/master/Dockerfile
RUN echo "4" > /tmp/debug_level &&\
    rm /lib/preinit/* &&\
    echo > /lib/preinit/00_empty_dummy_script &&\
    /etc/init.d/gpio_switch disable &&\
    /etc/init.d/led disable &&\
    /etc/init.d/odhcpd disable &&\
    /etc/init.d/sysctl disable &&\
    /etc/init.d/sysfixtime disable &&\
    /etc/init.d/sysntpd disable

RUN opkg update
RUN opkg install dnsmasq

CMD ["/sbin/init"]
