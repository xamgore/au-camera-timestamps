#!/bin/bash

in1="$1"
in2="$2"
crf="${3:-17}"

filename=$(basename -- "$in1")
output="${filename%.*}.out.mp4"

# ffmpeg -i "$in1" -i "$in2" \
#   -filter_complex '[0:v][1:v]hstack=inputs=2[v]' \
#   -map '[v]' -ac 2  "$output"

ffmpeg -i "$in1" -i "$in2" \
  -filter_complex '[1][0]scale2ref=oh*mdar:ih[2nd][ref];[ref][2nd]hstack[v]' \
  -map '[v]' -map 0:a -c:v libx264 -crf "$crf" -preset ultrafast "$output"

# TODO: better quality
# -preset slower
