#! /usr/bin/env bash

apt-get update
apt-get install -y apache2
a2enmod userdir headers
/usr/sbin/service apache2 restart

