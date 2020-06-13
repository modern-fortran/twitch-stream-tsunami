#!/bin/bash

fpm build
fpm run > out.txt
python3 plot_water_height.py out.txt 10
rm water_height.mp4
./png2mp4.sh water_height 24
rm *.png
