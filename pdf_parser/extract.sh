#!/bin/bash

if="$1"
pages=$(pdfinfo "$if" | sed -nre 's/^Pages: +([0-9]+)$/\1/p')
for ((i=1; i<=$pages; i++)) ;do
    printf "%s %d\n" "$(pdftotext -f $i -l $i -layout "$if" - | head -n 1)" $i
done
