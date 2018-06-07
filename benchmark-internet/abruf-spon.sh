#!/bin/bash
# same proxy as in interactive BASH:
# export all_proxy=socks://192.168.20.57:3128/
# export ftp_proxy=http://192.168.20.57:3128
# export http_proxy=http://192.168.20.57:3128
# export https_proxy=https://192.168.20.57:3128
# export no_proxy=localhost,127.0.0.0/8,::1,192.168.20.0/24

SCRIPT=$(readlink -f $0)
# echo $SCRIPT
MYDIR=$(dirname $SCRIPT)
MYSCRIPT=$(basename $SCRIPT)
TS=$(date +'%F-%H-%M')
# get the actual URL(s):
source $MYDIR/urls.sh
LOG=$MYDIR/${MYSCRIPT}.log
# echo $LOG

{ time \
wget --no-check-certificate -pEH -U "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" $SPON \
2>> $LOG ; \
} 2>> $LOG
