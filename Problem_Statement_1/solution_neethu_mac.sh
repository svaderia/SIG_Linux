#!/bin/bash

if [ "$1" -lt 1 ] || [ "$1" -gt 999999 ]
then
	echo range - 1 - 999999
else


url_jpg="https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-$1.jpg"
url_png="https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-$1.png"

echo "$url_jpg"

wget $url_jpg

DIR=`pwd`
echo $DIR

# osascript -e 'tell application "System Events"
# 	set desktopCount to count of desktops
# 		repeat with desktopNumber from 1 to desktopCount
# 			tell desktop desktopNumber
# 				set picture to "'$DIR'/wallheaven-21.jpg" 
# 			end tell
# 		end repeat
# end tell'


# osascript -e 'tell application "Finder"
# 	set desktop picture to "'$DIR'/wallhaven-'$1'.jpg" as POSIX file
# end tell'

if [ -e "$DIR"/wallhaven-"$1".jpg ]
then
	osascript -e 'tell application "Finder"
	set desktop picture to "'$DIR'/wallhaven-'$1'.jpg" as POSIX file
end tell'

else
	wget $url_png
	osascript -e 'tell application "Finder"
	set desktop picture to "'$DIR'/wallhaven-'$1'.png" as POSIX file
end tell'

fi


fi