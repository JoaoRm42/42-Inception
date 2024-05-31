#!/bin/bash

sleep 5s
cd /var/www/wordpress
if [ ! -f "/var/www/wordpress/index.php" ]; then
    wp core download --allow-root
    wp config create --allow-root --dbname=$DB --dbuser=$DB_USER --dbpass=$DB_USER_PSWD --dbhost=$DB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci"
    wp core install --allow-root \
	--url=https://$DOMAIN \
	--title=$TITLE_WP \
	--admin_user=$SPUSR_WP\
	--admin_password=$SPUSR_PWD_WP \
	--admin_email=$SPUSR_EMAIL_WP \

	wp user create --allow-root \
		$USR_WP \
		$USR_EMAIL_WP \
		--role=author \
		--user_pass=$USR_PWD_WP
fi

sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/7.4/fpm/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/7.4/fpm/php.ini
sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/7.4/fpm/php.ini
sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php/7.4/fpm/php.ini

service php7.4-fpm start 
service php7.4-fpm stop
/usr/sbin/php-fpm7.4 -F -y /etc/php/7.4/fpm/php-fpm.conf
