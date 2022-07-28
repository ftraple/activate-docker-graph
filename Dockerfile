FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y xterm
RUN useradd -ms /bin/bash xterm

USER xterm
WORKDIR /home/xterm

