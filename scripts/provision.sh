#! /usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

apt-get update
apt-get install -y apache2 nodejs

echo "ServerName localhost" > /etc/apache2/conf-available/servername.conf
a2enconf servername
a2enmod userdir headers

/usr/sbin/service apache2 restart

cd /vagrant/make-mesh
nodejs file-server.js > /home/vagrant/node-output.log &
