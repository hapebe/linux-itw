#!/bin/bash
PIDS=$(ps -ef | grep -e " ping -DOn [0-9]" | awk '{ print $2 }' | tr '\n' ' ')
kill -s SIGQUIT $PIDS
