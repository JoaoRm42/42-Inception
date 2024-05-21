# https://developer.wordpress.org/cli/commands/
# https://www.php.net/manual/en/install.fpm.php

#!/bin/bash

# Function to install WordPress
install_wordpress() {
    wp core install --url="$DOMAIN" \
                    --title="$TITLE_WP" \
                    --admin_user="$SPUSR_WP" \
                    --admin_password="$SPUSR_PWD_WP" \
                    --admin_email="$SPUSR_EMAIL_WP" \
                    --skip-email \
                    --path="$PATH_WP" \
                    --allow-root
}

# Function to create a new WordPress user
create_wp_user() {
    wp user create "$USR_WP" "$USR_EMAIL_WP" \
                   --user_pass="$USR_PWD_WP" \
                   --role=author \
                   --path="$PATH_WP" \
                   --allow-root
}

# Main script execution
main() {
    echo "Starting WordPress installation..."
    install_wordpress
    echo "WordPress installation completed."

    echo "Creating new WordPress user..."
    create_wp_user
    echo "New WordPress user created."

    echo "Starting PHP-FPM..."
    /usr/sbin/php-fpm7.4 -F
}

# Execute the main function
main
