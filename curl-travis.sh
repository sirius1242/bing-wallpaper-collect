#!/bin/bash

workdir="assets/"
target="thumbnails/"
GH_REPO="github.com/sirius1242/bing-wallpaper-collect.git"
# [[ -z $1 ]] && workdir='/root/git/bing-wallpaper/assets/' || workdir=$1
site=cn.bing.com
text=`wget -nv -O- $site`
#text=`curl -L $site`
if [[ -z $text ]]; then
	echo "connecting to $site failed!"
    exit 1
fi
url=`echo "$text" | grep 'g_img={url' | sed -n 's#.*/\(th?id=[^"]*.jpg\).*rf.*#\1#;p'`
filename=`echo $url | sed -n 's#.*OHR\.\([^"]*\.jpg\)#\1#;p'`
echo file:$site$url
if [[ -e $workdir$filename ]]; then
	echo "file exist!" 
    exit 1
else
    git checkout master
	wget -nv -O $workdir$filename "https://$site/$url"
	git add $workdir$filename
    convert $workdir$filename -resize 10% $target$filename
    git add $target$filename
fi
