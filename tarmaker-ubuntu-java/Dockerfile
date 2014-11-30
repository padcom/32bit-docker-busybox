FROM 32bit/ubuntu:14.04

MAINTAINER Matthias Hryniszak <padcom@gmail.com>

RUN apt-get update -q && \
    apt-get install -qy busybox-static curl

RUN mkdir /rootfs
WORKDIR /rootfs
RUN mkdir bin etc dev dev/pts lib proc sys tmp
RUN touch etc/resolv.conf
RUN cp /etc/nsswitch.conf etc/nsswitch.conf
RUN echo root:x:0:0:root:/:/bin/sh > etc/passwd
RUN echo root:x:0: > etc/group
RUN ln -s bin sbin
RUN cp /bin/busybox bin
RUN /bin/busybox --install -s bin
RUN bash -c "cp /lib/i386-linux-gnu/lib{c,m,dl,rt,nsl,nss_*,pthread,resolv}.so.* lib"
RUN cp /lib/i386-linux-gnu/ld-linux.so.2 lib

# Install Java
RUN mkdir -p /rootfs/usr/lib/jvm /rootfs/usr/bin && \
    curl -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jre-8u25-linux-i586.tar.gz -L -k | gzip -dc | tar -xf - -C /rootfs/usr/lib/jvm && \
    ln -s /usr/lib/jvm/jre1.8.0_25 /rootfs/usr/lib/jvm/default-java && \
    ln -s /usr/lib/jvm/default-java/bin/java /rootfs/usr/bin/java

RUN tar cf /rootfs.tar .
RUN for X in console null ptmx random stdin stdout stderr tty urandom zero ; do tar uf /rootfs.tar -C/ ./dev/$X ; done
