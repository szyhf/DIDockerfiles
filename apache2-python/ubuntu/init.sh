#!bin/sh
chgrp www-data /var/web -R
chmod g+rw /var/web -R
set -e
apache2ctl -DFOREGROUND