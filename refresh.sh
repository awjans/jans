#!/bin/bash
cd "${0%/*}"
pwd
git pull
find -type d -exec chmod -R 755 {} \;
find -type f -exec chmod -R 644 {} \;
chown -R root:www-data php/www
chmod 755 refresh.sh
