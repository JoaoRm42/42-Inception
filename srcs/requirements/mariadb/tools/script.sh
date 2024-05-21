# Start MariaDB service
service mariadb start

# Run multiple SQL statements in a single command
mariadb -u root <<EOF
-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS \`${DB}\`;

-- Create the user if it does not exist and grant privileges
CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_USER_PSWD}';
GRANT ALL PRIVILEGES ON \`${DB}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_USER_PSWD}';

-- Set the root password and flush privileges
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PSWD}';
FLUSH PRIVILEGES;
EOF

# Shutdown MariaDB safely
mariadb-admin -u root -p${DB_ROOT_PSWD} --wait-for-all-slaves shutdown

# Start MariaDB safely
mysqld_safe
