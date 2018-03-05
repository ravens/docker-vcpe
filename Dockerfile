FROM openwrt:latest
MAINTAINER Yan Grunenberger <yan@grunenberger.net>

EXPOSE 80
EXPOSE 22

USER root

RUN mkdir /var/lock
RUN mkdir /var/run

# simplified version of https://github.com/m-creations/docker-openwrt-x64/blob/master/Dockerfile
RUN echo "4" > /tmp/debug_level
RUN rm /lib/preinit/*
RUN echo > /lib/preinit/00_empty_dummy_script 
RUN /etc/init.d/gpio_switch disable 
RUN /etc/init.d/led disable 
RUN /etc/init.d/cron disable
RUN /etc/init.d/network disable
RUN /etc/init.d/odhcpd disable
RUN /etc/init.d/sysctl disable
RUN /etc/init.d/sysfixtime disable 
RUN /etc/init.d/sysntpd disable

RUN opkg update
RUN opkg install dnsmasq

CMD ["/sbin/init"]
