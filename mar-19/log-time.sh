#!/bin/bash
dt=$(date +'%F %T')
echo $dt >> ~/time.log
wall $dt
