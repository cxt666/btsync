FROM ubuntu:14.04

# This Dockerfile derived from andryyy/btsync with small modifications
#
# /var/btshare    : host directory for data
# /btshare/data   : container directory for data
# :8888           : Web UI Port
# :8889           : Connections Port
# :3838           : 
# :3000           : 
# Command to launch:
#    docker.io run -d -p 8888:8888 -p 8889:8889 -p 3838:3838/udp -p 3000:3000/udp -v /var/btshare:/btsync/data btsync

MAINTAINER mathias@menzer.net

RUN apt-get update -y && apt-get install -y \
  wget
RUN adduser --uid 1999 --disabled-password --home=/btsync --gecos "" btsync
WORKDIR /btsync
RUN /bin/bash -c "echo -e '\
   { \n \
	  \"device_name\": \"Docker.io $(hostname)\", \n \
      \"listening_port\": 36999, \n \
      \"use_upnp\" : true, \n \
      \"webui\" : \n \
      { \n \
        \"directory_root\" : \"/btsync\", \n \
        \"listen\" : \"0.0.0.0:8888\" \n \
      } \n \
   }'" > /btsync/btsync.conf

RUN test -z $(arch | grep 64) && arch=i386 || arch=x64 ;\
    wget --content-disposition -O - http://download-new.utorrent.com/endpoint/btsync/os/linux-$(echo $arch)/track/stable | tar xfvz -


VOLUME /btsync/data
EXPOSE 8888
USER btsync
