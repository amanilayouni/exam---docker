#!/bin/bash
set -e

service mariadb start || service mysql start

# attendre que MariaDB réponde
until mysqladmin ping --silent; do
  sleep 1
done

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS wordpress_db;
CREATE USER IF NOT EXISTS 'wordpress_user'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_user'@'localhost';
FLUSH PRIVILEGES;
EOF
