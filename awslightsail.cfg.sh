#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt -y install lsb-release apt-transport-https ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.3.list
sudo apt update
sudo apt -y install apache2 mariadb-server php7.3 composer certbot python-certbot-apache ufw
sudo apt -y install php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath libapache2-mod-php7.3
sudo ufw enable
sudo ufw allow 'WWW Full'
sudo ufw allow 'OpenSSH'
sudo mkdir /src
sudo git clone https://github.com/awjans/jans.git /src/jans
sudo chmod a+x /src/jans/refresh.sh
sudo /src/jans/refresh.sh
sudo ln -s /src/jans/php/www/public /var/www/jans
cat | sudo tee /etc/hosts <<EOF
127.0.1.1  jans.org   www.jans.org andrew.jans.org
EOF
sudo a2enmod ssl
sudo a2ensite jans.org
sudo certbot run -n --apache --agree-tos --email webmaster@jans.org --domains jans.org,www.jans.org,andrew.jans.org
sudo systemctl restart apache2
