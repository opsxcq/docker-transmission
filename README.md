# Docker image for transmission torrent client

A Docker image for Transmission torrent client based on Debian Jessie.

To start it simply run

    docker run -d --restart=always \
    -v "$(pwd)/complete:/downloads" \
    -v "$(pwd)/incomplete:/incomplete" \
    -e TRANSMISSION_PASSWORD=secret \
    -e TRANSMISSION_DOWNLOAD_LIMIT=1024 \
    -e TRANSMISSION_DOWNLOAD_QUEUE=100 \
    -p 9091:9091 \
    strm/transmission

Then just go to your [transmission web interface](http://localhost:9091/transmission), login with the user ```transmission``` and the password provided in ```TRANSMISSION_PASSWORD``` variable

### Image parameters

There are several useful parameters that will be passed to ```settings.json``` configuration file

  * TRANSMISSION_PASSWORD - Password for transmission web interface
  * TRANSMISSION_DOWNLOAD_LIMIT - Download bandwidth limit, in kilobytes per second
  * TRANSMISSION_DOWNLOAD_QUEUE - Download queue size, aka, how many simultaneous downloads

## Image volumes

  * /downloads - where transmission will store downloaded torrents
  * /incomplete - where transmission will keep unfinished torrents
