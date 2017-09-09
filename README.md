# Docker image for transmission torrent client
[![Docker Pulls](https://img.shields.io/docker/pulls/strm/transmission.svg?style=plastic)](https://hub.docker.com/r/strm/transmission/)

Transmission is a BitTorrent client which features a variety of user interfaces on top of a cross-platform back-end. Transmission is free software licensed under the terms of the GNU General Public License (GNU GPL), with parts under the MIT License. This repository is a Docker image for Transmission torrent client based on Debian Jessie.

To start it simply run
```
    docker run -d --restart=always \
    -v "$(pwd)/complete:/downloads" \
    -v "$(pwd)/incomplete:/incomplete" \
    -e TRANSMISSION_PASSWORD=secret \
    -e TRANSMISSION_DOWNLOAD_LIMIT=1024 \
    -e TRANSMISSION_DOWNLOAD_QUEUE=100 \
    -p 9091:9091 \
    strm/transmission
```

Then just go to your [transmission web interface](http://localhost:9091/transmission), login with the user ```transmission``` and the password provided in ```TRANSMISSION_PASSWORD``` variable

If you prefer to use `docker-compose`, here an example:

```
version: '2'
services:
    transmission:
        image: strm/transmission
        restart: always
        ports:
            - "9091:9091"
        volumes:
            - /downloaded:/downloads
            - /incomplete:/incomplete
        environment:
            - TRANSMISSION_PASSWORD=secret
            - TRANSMISSION_DOWNLOAD_LIMIT=1024
            - TRANSMISSION_DOWNLOAD_QUEUE=20
```

## Image parameters

There are several useful parameters that will be passed to ```settings.json``` configuration file

  * TRANSMISSION_PASSWORD - Password for transmission web interface
  * TRANSMISSION_DOWNLOAD_LIMIT - Download bandwidth limit, in kilobytes per second
  * TRANSMISSION_DOWNLOAD_QUEUE - Download queue size, aka, how many simultaneous downloads

## Image volumes

  * /downloads - where transmission will store downloaded torrents
  * /incomplete - where transmission will keep unfinished torrents

