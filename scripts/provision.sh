#! /usr/bin/env bash

apt-get update
apt-get install -y apache2

echo "ServerName localhost" > /etc/apache2/conf-available/servername.conf
a2enconf servername
a2enmod userdir headers

/usr/sbin/service apache2 restart

