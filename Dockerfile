FROM debian:jessie

MAINTAINER opsxcq <opsxcq@thestorm.com.br>

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    software-properties-common \
    transmission-daemon && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD settings.json /etc/transmission-daemon/
ADD main.sh /main.sh

RUN useradd --system --uid 666 -M --shell /usr/sbin/nologin transmission

RUN mkdir -p /incomplete && chown -R transmission: /incomplete && \
    mkdir -p /downloads && chown -R transmission: /downloads && \
    chown -R transmission: /etc/transmission-daemon

VOLUME /downloads
VOLUME /incomplete

EXPOSE 9091
EXPOSE 6669/udp

USER transmission

CMD ["/main.sh"]
