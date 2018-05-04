#!/bin/bash

# ./pdf2png.sh tapl08_18.pdf out.png
#   out-0.png out-1.png ... out-19.png

# imagemagic must be installed
convert -density 300 "$1" -quality 100 "$2"
