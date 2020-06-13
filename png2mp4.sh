#!/bin/bash

fr=$2
br=4096k
opts='-y -f image2 -r '$fr' -i img%03d.png -vcodec'

x=0
for i in ${1}*.png; do
  counter=$(printf %03d $x)
  ln -sf "$i" img"$counter".png
  x=$(($x+1))
done

#ffmpeg $opts libtheora -b:v $br -r $fr ${1}.ogg
ffmpeg $opts libx264 -b:v $br -r $fr ${1}.mp4

rm img*.png

