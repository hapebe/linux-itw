#!/bin/bash
APACHE_VHOSTS_DIR=/var/www/vhosts

if [ $# -lt 1 ] ; then
        echo "usage:"
        echo "$0 <site name (DNS and directory name)>"
        printf "\te.g. $0 sample.net\n"
        echo ""
	printf "\t<site name> will be used as htdocs directory name\n"
        exit 1
fi

SITENAME=$1

cd $APACHE_VHOSTS_DIR/$SITENAME/http
chown -Rc root:www-data .
chmod -Rc 775 .
