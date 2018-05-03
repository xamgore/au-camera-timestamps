#!/bin/bash

in1="$1"
in2="$2"
crf="${3:-30}"

filename=$(basename -- "$in1")
output="${filename%.*}.out.mp4"

ffmpeg -i "$in1" -i "$in2" \
  -filter_complex '[0:v][1:v]hstack=inputs=2[v];[0:a][1:a]amerge[a]' \
  -map '[v]' -map '[a]' -ac 2  "$output"

# -preset veryfast
# -c:v libx264 -crf "$crf"
