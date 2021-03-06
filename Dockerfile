FROM alpine:latest

MAINTAINER haven200 <haven200@gmail.com>

WORKDIR /opt/src

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/'  /etc/apk/repositories \
    && apk update && apk add --no-cache transmission-daemon \
    && mkdir -p /etc/transmission-daemon && mkdir -p /mnt/bt/kodi 

COPY run.sh /opt/src/run.sh

EXPOSE 12345/tcp 123455/udp 80/tcp

VOLUME [ "/mnt/bt/kodi" ]

CMD [ "/bin/sh","/opt/src/run.sh" ]
HEALTHCHECK CMD netstat -ln | grep 12345 || exit 1

