#!/bin/bash
apt -y update
apt -y upgrade
apt -y install lsb-release apt-transport-https ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.3.list
apt -y update
apt -y install apache2 mariadb-server php7.3 composer certbot python-certbot-apache php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath libapache2-mod-php7.3
/src/jans/refresh.sh
a2enmod ssl
a2ensite jans.org
certbot run --noninteractive --apache --redirect --agree-tos --email webmaster@jans.org --domains jans.org,www.jans.org,andrew.jans.org
systemctl restart apache2
