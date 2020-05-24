#!/bin/bash
USERNAME=$(id -un)
sudo chown $USERNAME:$USERNAME *.pcapng
