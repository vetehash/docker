#!/bin/bash

cat << EOF > /etc/apache2/sites-available/000-default.conf
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