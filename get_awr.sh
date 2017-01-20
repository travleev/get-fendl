#!/bin/bash

# AWR data block is copied from existing xsdir file whose location
# must be given in the command line. If not given, the script assumes
# that the AWR data block is available in `awr.xsdir` file.

if [[ -z "$@" ]]; then
    if [[ -f "awr.xsdir" ]]; then
        echo "AWR data will be taken from existing file awr.xsdir"
        exit 0
    else
        echo "File awr.xsdir does not exist. Specify location of existing xsdir file, whose AWR section"
        echo "will be copied to newly generated xsdir files."
        exit 1
    fi
else
    xsdir="$1"
    if [[ -f $xsdir ]]; then
        echo "AWR section for xsdir will be copied from $xsdir"
        csplit -q $xsdir '/directory/1' # split xsdir file to 2 parts: xx00 containing AWR data
        mv xx00 awr.xsdir
        rm xx??
        exit 0
    else
        echo "File does not exist: $xsdir"
        exit 1
    fi
fi    

