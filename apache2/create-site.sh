#!/bin/bash

# Creates a new virtual host - apache site config and htdocs scaffolding.

SCRIPTPWD=$(pwd)

APACHE_VHOSTS_DIR=/var/www/vhosts
APACHE_SITES_DIR=/etc/apache2/sites-available

if [ $# -lt 2 ] ; then
        echo "usage:"
        echo "$0 <site name (DNS and directory name)> <site number>"
        printf "\te.g. $0 sample.net 100\n"
        echo ""
	printf "\t<site name> will be used both for the htdocs directoy and DNS name\n"
	printf "\t<site number> will be used for config file name in ${APACHE_SITES_DIR}, e.g. 100-sample.net.conf\n"
        exit 1
fi

SITENAME=$1
SITEID=$2

# if [ 0 -eq 1 ] ; then
mkdir -p $APACHE_VHOSTS_DIR/$SITENAME
cd $APACHE_VHOSTS_DIR/$SITENAME
mkdir http
mkdir logs
mkdir import
mkdir export
chmod 775 {http,logs,import,export}
cd ..
chown -R root:www-data $APACHE_VHOSTS_DIR/$SITENAME
# fi

export SITENAME SITEID
cat $SCRIPTPWD/xxx-sitename.conf | envsubst > $APACHE_SITES_DIR/$SITEID-$SITENAME.conf

a2ensite $SITEID-$SITENAME.conf
systemctl restart apache2
