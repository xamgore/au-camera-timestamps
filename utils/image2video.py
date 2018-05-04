#!/usr/bin/env python3

# grab all *.png files in the current folder & convert them to a video.
# ./image2video.py out.mp4

import os
import sys
import subprocess as subp
from natsort import natsorted, ns
from pathlib import Path

paths   = [p for p in os.listdir() if Path(p).suffix == '.png']
sources = []
filters = []
concats = []

for path in natsorted(paths, key=str.lower):
    sources.append(f'-loop 1 -t 0.3 -i {path}')

for i in range(len(paths)):
    filters.append(f'[{i}:v]scale=trunc(iw/2)*2:trunc(ih/2)*2[v{i}];')
    concats.append(f'[v{i}]')

cmd = f'ffmpeg -y {" ".join(sources)} -filter_complex \'{" ".join(filters)}{"".join(concats)} concat=n={len(paths)}:v=1:a=0,format=yuv420p[v]\' -map "[v]" {sys.argv[1]}'

print(subp.check_output(cmd, shell=True))
