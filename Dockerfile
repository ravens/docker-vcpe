FROM openwrt:latest

EXPOSE 80

USER root

RUN mkdir /var/lock
RUN mkdir /var/run

RUN echo "4" > /tmp/debug_level &&\
    rm /lib/preinit/* &&\
    echo > /lib/preinit/00_empty_dummy_script &&\
    /etc/init.d/cron disable &&\
    /etc/init.d/gpio_switch disable &&\
    /etc/init.d/led disable &&\
    /etc/init.d/odhcpd disable &&\
    /etc/init.d/sysctl disable &&\
    /etc/init.d/sysfixtime disable &&\
    /etc/init.d/sysntpd disable


RUN opkg update
RUN opkg install dnsmasq

# /etc/init.d/network disable &&\
#

# using exec format so that /sbin/init is proc 1 (see procd docs)
CMD ["/sbin/init"]
