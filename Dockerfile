FROM debian:buster

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 HOME=/root DEBIAN_FRONTEND=noninteractive INITRD=No TERM=xterm
ADD build-files /build-files
RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    apt-get update && \
    apt-get install -y procps locales && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure -f noninteractive tzdata && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get -y autoremove && \
    apt-get install -y apt-cacher-ng && \
    apt-get clean && \
    sed -i 's/#\ PassThroughPattern:\ \.\*/PassThroughPattern:\ \.\*/g' /etc/apt-cacher-ng/acng.conf && \
    rm -rf /var/lib/apt/lists/* /build-files

VOLUME ["/var/log", "/var/cache/apt-cacher-ng"]

CMD ["/usr/sbin/apt-cacher-ng", "-c", "/etc/apt-cacher-ng/", "ForeGround=1"]

EXPOSE 3142
