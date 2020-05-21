#!/bin/bash

chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# to simulate suid attack
cp /bin/bash /bin/bashroot
chmod +s /bin/bashroot

echo '[+] Starting mysql...'
service mysql start

echo '[+] Starting apache'
service apache2 start

while true
do
    tail -f /var/log/apache2/*.log
    exit 0
done
