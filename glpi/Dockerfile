FROM debian:latest

MAINTAINER VeTeHash < vetehash@gmail.com >

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update 
RUN apt-get -y install apache2 php5 php5-mysql php5-ldap php5-xmlrpc php5-imap curl php5-curl php5-gd wget

COPY glpi.sh /etc/
RUN chmod +x /etc/glpi.sh
ENTRYPOINT ["/etc/glpi.sh"]

EXPOSE 80
