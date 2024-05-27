#!/bin/bash

echo "Starting WordPress installation..."
wp user create "$USR_WP" "$USR_EMAIL_WP" \
                --user_pass="$USR_PWD_WP" \
                --role=author \
                --path="$PATH_WP" \
                --allow-root
echo "WordPress installation completed."

echo "Creating new WordPress user..."
wp core install --url="$DOMAIN" \
                --title="$TITLE_WP" \
                --admin_user="$SPUSR_WP" \
                --admin_password="$SPUSR_PWD_WP" \
                --admin_email="$SPUSR_EMAIL_WP" \
                --skip-email \
                --path="$PATH_WP" \
                --allow-root
echo "New WordPress user created."

echo "Starting PHP-FPM..."
/usr/sbin/php-fpm7.4 -F