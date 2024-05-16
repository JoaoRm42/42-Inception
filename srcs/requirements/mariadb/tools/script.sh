service mariadb start
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`${DB}\`;"
mariadb -u root -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_USER_PSWD}';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON \`${DB}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_USER_PSWD}';"
mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PSWD}';FLUSH PRIVILEGES;"
mariadb-admin -u root -p $DB_ROOT_PSWD --wait-for-all-slaves shutdown
mysqld_safe