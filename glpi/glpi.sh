#!/bin/bash

if [ -d "/var/www/glpi" ];
then
	echo "GLPI is already installed"
else
	wget -P https://github.com/glpi-project/glpi/releases/download/9.1/glpi-9.1.tar.gz
	tar -xzf glpi-9.1.tar.gz
	rm -Rf glpi-9.1.tar.gz
	chown -R www-data:www-data /var/www/glpi
fi

cat << EOF > /etc/apache2/sites-enabled/000-default.conf
<VirtualHost *:80>
	DocumentRoot /var/www/glpi
	<Directory /var/www/glpi>
		AllowOverride All
		Order Allow, Deny
		Allow from all
    </Directory>

		ErrorLog /var/log/apache2/error-glpi.log
		AccessLog /var/log/apache2/access-glpi.log combined
</VirtualHost>
EOF

a2enmod rewrite && service apache2 restart && service apache2 stop

/usr/sbin/apache2ctl -D FOREGROUND