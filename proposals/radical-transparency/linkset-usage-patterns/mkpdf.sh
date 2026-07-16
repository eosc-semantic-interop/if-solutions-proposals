#! /usr/bin/env bash

# get the script's location folder and move into it
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"

./mkln.sh 

# run over the markdown files in the folder and generate a PDF for each one
mds=$(find . -name '??-*.md' | sort)
for md in $mds; do
    pdf="${md%.md}.pdf"
    echo "Generating PDF for $md -> $pdf"
    pandoc "$md" -o "$pdf" --pdf-engine=xelatex
done