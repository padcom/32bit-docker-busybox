FROM 32bit/ubuntu:14.04

MAINTAINER Matthias Hryniszak <padcom@gmail.com>

RUN apt-get update -q && \
    apt-get install -qy busybox-static

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
RUN tar cf /rootfs.tar .
RUN for X in console null ptmx random stdin stdout stderr tty urandom zero ; do tar uf /rootfs.tar -C/ ./dev/$X ; done
