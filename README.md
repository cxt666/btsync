Tests with BitTorrent Sync in Docker
==============================
> **Attention:**
>  This may or may not work, I'm currently just playing around with building docker images and writing Dockerfiles.

A few Comments
-------------------
BitTorrent Sync is a Dropbox/Copy/GroogleDrive alternative based on P2P Technology

This Dockerfile derived from andryyy/btsync with small modifications

Usage
-----

	/var/btshare    : host directory for data
	/btshare/data   : container directory for data
	:8888           : Web UI Port
	:8889           : Connections Port
	:3838           : 
	:3000           : 

Command to Launch: 

	docker.io run -d -p 8888:8888 -p 8889:8889 -p 3838:3838/udp -p 3000:3000/udp -v /var/btshare:/btsync/data btsync
