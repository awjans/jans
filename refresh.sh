#!/bin/bash
cd /src/jans
git pull
find -type d -exec chmod -R a+rx {} \;
find -type d -exec chmod -R u+rwx {} \;
find -type f -exec chmod -R a+r {} \;
find -type f -exec chmod -R u+rw {} \;
chown -R root:www-data php/www