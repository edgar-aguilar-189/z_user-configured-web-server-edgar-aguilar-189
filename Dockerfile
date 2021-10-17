# Place instructions here
FROM ubuntu:latest

ENV USER eba19283
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install sudo -y
RUN apt-get install apache2 -y

RUN sudo adduser $USER
RUN sudo passwd -d $USER
RUN sudo usermod -aG sudo $USER

RUN a2enmod userdir
RUN a2enmod autoindex

WORKDIR /home/$USER/public_html
COPY index.html .
RUN mv index.html brian.html

Label Maintainer: "edgar.aguilar.189@my.csun.edu"
Expose 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
