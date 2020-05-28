#!/bin/bash
echo "Tree of /firma:"
tree /firma
echo "Directory listing of /home:"
ls -l /home
echo "Occurences of einkauf, verkauf or firma in /etc/passwd:"
grep einkauf /etc/passwd
grep verkauf /etc/passwd
grep firma /etc/passwd
