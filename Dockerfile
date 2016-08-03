FROM debian:jessie

MAINTAINER opsxcq <opsxcq@thestorm.com.br>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common transmission-daemon

ADD settings.json /etc/transmission-daemon/
ADD bootstrap.sh /bootstrap.sh

RUN mkdir -p /incomplete && chown -R debian-transmission: /incomplete && \
    mkdir -p /downloads && chown -R debian-transmission: /downloads && \
    chown -R debian-transmission: /etc/transmission-daemon

VOLUME /downloads
VOLUME /incomplete

EXPOSE 9091
EXPOSE 6669

USER debian-transmission

CMD ["/bootstrap.sh"]
