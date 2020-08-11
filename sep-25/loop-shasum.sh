#!/bin/bash
for i in $(seq 1 100) ; do
	for j in $(seq 1 100) ; do
		echo $(echo $i*100+$j | shasum | cut -d" " -f1);
	done
done
