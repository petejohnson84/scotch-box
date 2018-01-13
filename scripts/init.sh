#!/bin/bash

# Install WP-CLI (http://wp-cli.org/)
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# Create Wordpress database
mysql -u root -proot -e "create database if not exists wp";

# Install Wordpress
cd /var/www/public
wp core download
wp core config --dbhost=localhost --dbname=wp --dbuser=root --dbpass=root
wp core install --url=192.168.33.10 --title="WordPress Sandbox" --admin_name=admin --admin_password=@dm1n! --admin_email=me@wp.sandbox

# Change php.ini upload_max_filesize
sudo sed -i.bak "s/upload_max_filesize = 2M/upload_max_filesize = 8M/" /etc/php/7.0/apache2/php.ini
sudo /etc/init.d/apache2 restart