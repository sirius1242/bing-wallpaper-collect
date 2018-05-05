#!/bin/bash

#workdir=~/bing-wallpaper
[[ -z $1 ]] && workdir='/root/git/bing-wallpaper/assets/' || workdir=$1
site=cn.bing.com
cd $workdir
text=`wget -O- $site`
if [[ -z $text ]]; then
	echo "connecting to $site failed!" | mail -s "bing-wallpaper" root
fi
url=`echo $text | grep img={url | sed -n 's#.*\(/az/[^"]*\).*#\1#;p'`
filename=`echo $url | awk -F/ '{print $NF}'`
echo file:$site$url
if [[ -e $filename ]]; then
	echo "file exist!" | mail -s "bing-wallpaper" root
	echo "file exist!"
else
	wget -O $workdir$filename https://$site/$url
	git add $filename
	git commit -a -m `date -I`
	git push origin master
fi
