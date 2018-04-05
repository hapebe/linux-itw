#!/bin/bash
nice -n 19 tar -cJf /tmp/tar-p19.tar.xz /home/. &
nice -n -10 tar -cJf /tmp/tar-m10.tar.xz /home/. &
