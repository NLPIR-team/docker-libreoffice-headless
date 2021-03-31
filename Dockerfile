FROM ubuntu:20.04
LABEL maintainer="yangyaofei@gmail.com"
# RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list
RUN apt update && \
    apt install -y --no-install-recommends \
        openjdk-11-jre \
        ca-certificates \
        procps \
        wget \
        fontconfig \
        software-properties-common && \
    add-apt-repository ppa:libreoffice/libreoffice-7-0 && \
    apt update && \
    apt install -y libreoffice --no-install-recommends && \
    apt autopurge && \
    rm -rf /var/lib/apt/lists/*
# Install fonts
RUN wget https://github.com/adobe-fonts/source-han-mono/releases/download/1.002/SourceHanMono.ttc \
        -O  /usr/share/fonts/SourceHanMono.ttc && \
    wget https://github.com/adobe-fonts/source-han-serif/releases/download/1.001R/SourceHanSerif.ttc \
        -O /usr/share/fonts/SourceHanSerif.ttc && \
    wget https://github.com/adobe-fonts/source-han-sans/releases/download/2.002R/SourceHanSans.ttc \
        -O /usr/share/fonts/SourceHanSans.ttc

COPY ./fonts/norm/* /usr/share/fonts/
COPY ./fonts/other/* /usr/share/fonts/
COPY ./fonts/MS/* /usr/share/fonts/
COPY ./fonts/ST/* /usr/share/fonts/
COPY ./fonts/FZ/* /usr/share/fonts/
COPY ./fonts/times/* /usr/share/fonts/
RUN fc-cache -fv