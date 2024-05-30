#!/bin/bash
set -e

# Wait for the database to be available
until wp db check --path="${PATH_WP}" --allow-root; do
  echo "Waiting for database..."
  sleep 5
done

# Check if WordPress is already installed
if ! wp core is-installed --path="${PATH_WP}" --allow-root; then
  echo "Installing WordPress..."
  wp core install --url="${DOMAIN}" \
                  --title="${TITLE_WP}" \
                  --admin_user="${SPUSR_WP}" \
                  --admin_password="${SPUSR_PWD_WP}" \
                  --admin_email="${SPUSR_EMAIL_WP}" \
                  --skip-email \
                  --path="${PATH_WP}" \
                  --allow-root

  # Create an additional user
  wp user create "${USR_WP}" "${USR_EMAIL_WP}" \
                 --user_pass="${USR_PWD_WP}" \
                 --role=author \
                 --path="${PATH_WP}" \
                 --allow-root
else
  echo "WordPress is already installed."
fi

# Start PHP-FPM
exec php-fpm7.4 -F
