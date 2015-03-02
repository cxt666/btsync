FROM ubuntu:14.04

# This Dockerfile derived from andryyy/btsync with small modifications
# Target: the btsync.conf file is located on the external volume and can be modified there
# Requirements: /var/btshare
#
# /var/btshare            : host directory for data
# /var/btshare/conf       : host directory for config file
# /var/btshare/data       : host directory for data
# /btsync/conf            : container directory for config file
# /btsync/data            : container directory for data
# :8888                   : Web UI Port
# :36999                  : Connections Port
# :3838                   : 
# :3000                   : 
# Command to launch:
#    docker.io run -d -p 8888:8888 -p 8889:8889 -p 3838:3838/udp -p 3000:3000/udp -v /var/btshare/data:/btsync/data -v /var/btshare/conf cxt666/btsync

MAINTAINER cxt666 <root@menzer.net>

RUN apt-get update -y && apt-get install -y \
  wget
RUN adduser --uid 1999 --disabled-password --home=/btsync --gecos "" btsync
WORKDIR /btsync

ADD btsync.conf /btsync/conf/btsync.conf

RUN test -z $(arch | grep 64) && arch=i386 || arch=x64 ;\
    wget --content-disposition -O - http://download-new.utorrent.com/endpoint/btsync/os/linux-$(echo $arch)/track/stable | tar xfvz -


VOLUME /btsync
EXPOSE 8888
USER btsync
ENTRYPOINT /btsync/btsync --config /btsync/conf/btsync.conf --nodaemon