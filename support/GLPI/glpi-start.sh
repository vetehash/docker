#!/bin/bash

VERSION_GLPI=9.1.2
SRC_GLPI=https://github.com/glpi-project/glpi/releases/download/${VERSION_GLPI}/glpi-${VERSION_GLPI}.tar.gz
TAR_GLPI=glpi-${VERSION_GLPI}.tar.gz
FOLDER_GLPI=glpi/
FOLDER_WEB=/var/www/html/

if [ "$(ls ${FOLDER_WEB}${FOLDER_GLPI})" ];
then
echo "GLPI is already installed"
else
wget -P ${FOLDER_WEB} ${SRC_GLPI}
tar -xzf ${FOLDER_WEB}${TAR_GLPI} -C ${FOLDER_WEB}
rm -Rf ${FOLDER_WEB}${TAR_GLPI}
chown -R www-data:www-data ${FOLDER_WEB}${FOLDER_GLPI}
fi

echo -e "<VirtualHost *:80>\n\tDocumentRoot /var/www/html/glpi\n\n\t<Directory /var/www/html/glpi>\n\t\tAllowOverride All\n\t\tOrder Allow,Deny\n\t\tAllow from all\n\t</Directory>\n\n\tErrorLog /var/log/apache2/error-glpi.log\n\tLogLevel warn\n\tCustomLog /var/log/apache2/access-glpi.log combined\n</VirtualHost>" > /etc/apache2/sites-available/000-default.conf

a2enmod rewrite && service apache2 restart && service apache2 stop

/usr/sbin/apache2ctl -D FOREGROUND
