#!/bin/bash
echo "Enter"
read INP
X=${INP:6}
content=$(wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-$X.jpg -q -O -)
if [ -z "$content" ]
then
        echo "404 Error"
else
        curl https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-$X.jpg > new
        gconftool-2 -t string -s /desktop/gnome/background/picture_filename new

fi
