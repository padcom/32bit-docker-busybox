#!/bin/sh -e

./mkrootfs.sh tarmaker-ubuntu-java
docker build -t padcom/busybox-java:i386 .
