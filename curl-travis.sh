#!/bin/bash

workdir=./
# [[ -z $1 ]] && workdir='/root/git/bing-wallpaper/assets/' || workdir=$1
site=cn.bing.com
text=`wget -nv -O- $site`
#text=`curl -L $site`
if [[ -z $text ]]; then
	echo "connecting to $site failed!"
    exit 1
fi
url=`echo $text | grep img={url | sed -n 's#.*\(/az/[^"]*\).*#\1#;p'`
filename=`echo $url | awk -F/ '{print $NF}'`
echo file:$site$url
if [[ -e $filename ]]; then
	echo "file exist!" 
    exit 1
else
	wget -nv -O $workdir$filename https://$site/$url
	git add $filename
	git commit -a -m `date -I`
	git push origin master
fi
