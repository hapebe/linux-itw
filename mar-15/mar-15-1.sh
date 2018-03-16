#!/bin/bash
echo "Dieses Script legt eine Verzeichnisstruktur and Dateien an, anschließend wird diese mit tar archiviert."
echo

dirname="hauptverzeichnis"
if [ ! -d $dirname ]; then mkdir $dirname; fi
dirname="hauptverzeichnis/unterverzeichnis1"
if [ ! -d $dirname ]; then mkdir $dirname; fi
dirname="hauptverzeichnis/unterverzeichnis2"
if [ ! -d $dirname ]; then mkdir $dirname; fi

cp /usr/games/gnome-mines hauptverzeichnis/unterverzeichnis1
cp /usr/games/gnome-sudoku hauptverzeichnis/unterverzeichnis2

echo "Directory tree of \"hauptverzeichnis\":"
tree --noreport hauptverzeichnis | tee Kontrolle

tar -cvzf archive.tar.gz hauptverzeichnis
echo "Das Archive enthält Folgendes:"
tar -tvzf archive.tar.gz
