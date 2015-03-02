Tests with BitTorrent Sync in Docker
==============================
> __Attention:__
> 
>  This may or may not work, I'm currently just playing around with building docker images and writing Dockerfiles.

A few Comments
-------------------
BitTorrent Sync is a Dropbox/Copy/GroogleDrive alternative based on P2P Technology

This Dockerfile derived from andryyy/btsync with some modifications (Thanks André!)

---

Howto
-----

- Create the host directory, which will be used to store the data (for example: `mkdir /var/btshare`)
- Set the user permissions to UID 1999 (for example: `chown 9991:9991 -R /var/btshare`)
- Pull the image (for example: `docker.io pull cxt666/btsync`)
- Launch the container
  - On your local network, you should also use UDP (for example: `docker.io run -d -p 8888:8888 -p 36999:36999 -p 3838:3838/udp -p 3000:3000/udp -v /var/btsync:/btshare/data cxt666/btsync`)
  - If there are no BT Sync peers in the local network, you may leave the UDP ports: (for example: `docker.io run -d -p 8888:8888 -p 36999:36999 -v /var/btsync:/btshare/data cxt666/btsync`)

***

Overview
--------

	/var/btshare    : host directory for data
	/btsync/data    : container directory for data
	1999            : UID for btsync user inside the container
	:8888           : Web UI Port
	:8889           : Connections Port
	:3838           : UDP Connections
	:3000           : UDP Connections

---

**Possible commands to Launch:**

	docker.io run -d -p 36999:36999 -p 8889:8889 -v /var/btsync:/btshare/data cxt666/btsync
	docker.io run -d -p 36999:36999 -p 8889:8889 -p 3838:3838/udp -p 3000:3000/udp -v /var/btsync:/btshare/data cxt666/btsync
