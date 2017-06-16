#!/bin/bash

mkdir "$HOME/wallpapers/"
url="https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-$1.jpg"
filepath="$HOME/wallpapers/$1.jpg"

if [ "$(curl -s -o /dev/null -w "%{http_code}" http://www.example.org/)"=="200"]
then
	curl -o $filepath $url;
	gsettings set org.gnome.desktop.background picture-uri "file://$filepath";
else
	echo "the given url does not exist";
fi