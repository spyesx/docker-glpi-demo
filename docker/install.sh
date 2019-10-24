#!/bin/bash

WWW_DIR="/var/www/html"
VHOST=/etc/apache2/sites-enabled/000-default.conf
GLPI_DIR="${WWW_DIR}"
GLPI_SOURCE_URL="https://github.com/glpi-project/glpi/releases/download/9.4.4/glpi-9.4.4.tgz"

# Install tools

apt-get install -y wget


# Download and install GPLI

echo "Using ${GLPI_SOURCE_URL}"
wget -O /tmp/glpi.tar.gz $GLPI_SOURCE_URL --no-check-certificate
cd $WWW_DIR
tar -xvzf /tmp/glpi.tar.gz --strip 1

# chown -R www-data:www-data $GLPI_DIR


# Configure Apache
echo -e "<VirtualHost *:80>\n\tDocumentRoot /var/www/html/\n\n\t<Directory /var/www/html>\n\t\tAllowOverride All\n\t\tOrder Allow,Deny\n\t\tAllow from all\n\t</Directory>\n\n\tLogLevel warn\n</VirtualHost>" > /etc/apache2/sites-available/000-default.conf

# Add CRON
#echo "*/2 * * * * www-data /usr/bin/php /var/www/html/front/cron.php &>/dev/null" >> /etc/cron.d/glpi

#Start cron service
# service cron start


rm -Rf /tmp/glpi.tar.gz