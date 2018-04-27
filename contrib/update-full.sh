#!/bin/bash
#
# run this as root!
#
apt-get update; apt-get -y dist-upgrade; apt-get autoremove; apt-get autoclean
