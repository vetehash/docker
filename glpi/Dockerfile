FROM debian:latest

MAINTAINER VeTeHash < vetehash@gmail.com >

ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
&& apt -y install \
apache2 \
php5 \
php5-mysql \
php5-ldap \
php5-xmlrpc \
php5-imap \
curl \
php5-curl \
php5-gd \
wget

COPY glpi-start.sh /opt/
RUN chmod +x /opt/glpi-start.sh
ENTRYPOINT ["/opt/glpi-start.sh"]

EXPOSE 80
