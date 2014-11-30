#!/bin/sh

./mkrootfs.sh tarmaker-ubuntu
docker build -t padcom/busybox:i386 .
