#!/bin/bash
dpkg --get-selections | cut -f1 > installed-packages
