# https://developer.wordpress.org/cli/commands/
# https://www.php.net/manual/en/install.fpm.php

#!/bin/bash

# Function to install WordPress
install_wordpress() {
    wp core install --url="$DOMAIN_NAME" \
                    --title="$WP_TITLE" \
                    --admin_user="$WP_ADMIN_USER" \
                    --admin_password="$WP_ADMIN_PASSWORD" \
                    --admin_email="$WP_ADMIN_EMAIL" \
                    --skip-email \
                    --path="$WP_PATH" \
                    --allow-root
}

# Function to create a new WordPress user
create_wp_user() {
    wp user create "$WP_USER" "$WP_USER_EMAIL" \
                   --user_pass="$WP_USER_PASSWORD" \
                   --role=author \
                   --path="$WP_PATH" \
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
