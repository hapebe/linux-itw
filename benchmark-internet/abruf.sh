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
TS=$(date +'%F-%H-%M')
# get the actual URL(s):
source $MYDIR/urls.sh
LOG=$MYDIR/abruf.log
# echo $LOG
{ time wget --no-check-certificate -O $MYDIR/wget-100k-${TS}.download $FILE100K 2>> $LOG ; } 2>> $LOG
