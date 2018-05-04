#!/bin/bash

# ./pdf2png_cut.sh tapl08_18.pdf out.png
#   out-0.png out-1.png ... out-19.png

# imagemagic must be installed
convert -density 300 "$1" -gravity south -shave 0%x9% +repage "$2"
