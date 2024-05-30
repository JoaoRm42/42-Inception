#!/bin/bash
wp core install --url="$DOMAIN" \
                --title="$TITLE_WP" \
                --admin_user="$SPUSR_WP" \
                --admin_password="$SPUSR_PWD_WP" \
                --admin_email="$SPUSR_EMAIL_WP" \
                --skip-email \
                --path='/var/www/wordpress' \
                --allow-root
wp user create "$USR_WP" "$USR_EMAIL_WP" \
                --user_pass="$USR_PWD_WP" \
                --role=author \
                --path='/var/www/wordpress' \
                --allow-root
/usr/sbin/php-fpm7.4 -F
