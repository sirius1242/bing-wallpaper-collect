#!/bin/bash

source=${HOME}/bing-wallpaper/assets/
target=${HOME}/bw-thumbnails/
date=`date -I`
mkdir -p ${target}${date}
for i in $(diff <(ls $source) <(ls $target) | grep '<' | grep -v '.png' | cut -d" " -f 2)
do echo "convert ${source}$(basename $i) -resize 10% ${target}${date}/$(basename $i)"
convert ${source}$(basename $i) -resize 10% ${target}${date}/$(basename $i)
ln ${target}${date}/$(basename $i) ${target}/$(basename $i)
done
