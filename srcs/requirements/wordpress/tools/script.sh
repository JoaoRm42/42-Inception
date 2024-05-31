#!/bin/bash

#Using sleep so it has a small delay and we let mariadb
#fully initialize to prevent issues on startup
sleep 2s

#Making sure we have inside the correct installation
#folder so we can install everything inside it
cd /var/www/wordpress

#Check if there's index file inside our wordpress folder
#if not we download it and install everything to get it
#working properly
if [ ! -f "/var/www/wordpress/index.php" ]; then
	#Downloads WordPress Files
    wp core download --allow-root

	#Created wp-config.php
    wp config create --allow-root \
	--dbname=$DB \
	--dbuser=$DB_USER \
	--dbpass=$DB_USER_PSWD \
	--dbhost=$DB_HOST \
	--dbcharset="utf8" \
	--dbcollate="utf8_general_ci"

	#Install of the webpage
    wp core install --allow-root \
	--url=https://$DOMAIN \
	--title=$TITLE_WP \
	--admin_user=$SPUSR_WP\
	--admin_password=$SPUSR_PWD_WP \
	--admin_email=$SPUSR_EMAIL_WP \

	#Creation of the user
	wp user create --allow-root \
		$USR_WP \
		$USR_EMAIL_WP \
		--role=author \
		--user_pass=$USR_PWD_WP
fi

#Restart of php7.4-fpm service
service php7.4-fpm start 
service php7.4-fpm stop
/usr/sbin/php-fpm7.4 -F -y /etc/php/7.4/fpm/php-fpm.conf
