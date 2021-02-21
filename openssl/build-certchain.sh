#!/bin/bash
#
# source ./raspi-env.sh before his!
#
# from: https://stackoverflow.com/questions/18787491/adding-certificate-chain-to-p12pfx-certificate
# has to be run on the original web server, i.e. leonie (Raspberry Pi)
#
certdir=/etc/letsencrypt/live/$certHostname
# cat is obviously not necessary, because the full chain already exists -
# BUT actually you could simply chain PEMs this way!
cat $certdir/fullchain.pem >> /home/pi/certchain.pem
cd /home/pi
openssl pkcs12 -in certchain.pem -inkey $certdir/privkey.pem -passout pass:$certPass -export -out certchain.pkcs12
chown pi:pi certchain.pkcs12
rm /home/pi/certchain.pem
