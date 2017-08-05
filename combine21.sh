#!/bin/bash

if [ -z "$@" ]; then
    echo "Usage:"
    echo
    echo "  >combine21.sh  [xsdir [12]]"
    echo
    echo "where xsdir -- file containing the awr section of xsdir,"
    echo "and 1 or 2 -- type of cross-section data to generate."
    echo "by default, type-1 data produced."
    echo
    exit 0
fi    

./get_awr.sh "$@"

if [[ "0" -ne $? ]]; then 
    # previous script exited with an error.
    exit $?
fi    

cd ace21
dos2unix *

# prepare single xsdir from separate *.dir files:
cat ../awr.xsdir *.dir > xsdir.1

dos2unix -q xsdir.1

# fix capital letters in element names:
mv xsdir.1 xsdir.1.old
sed 's/\([A-Z]\)\([A-Z]\)/\1\L\2/g' xsdir.1.old > xsdir.1

# Prepare specs file for makxsf that is used to put all cross-sections into a single file
T=${2:-1}  # if not given in the command line, produce type 1 data.
sed "s/XX/21/g; s/T/$T/g" ../specs.head > specs  # specs line header
csplit -q xsdir.1 '/directory/1'
awk '{ print $1 }' xx01 >> specs       # list of nuclides
echo >> specs                          # final empty line

# run makxsf, but preliminary remove resultting files
rm xsdir21.$T fendl21.$T;
makxsf


# copy resulted files to current dir
if [ -f fendl21.$T ]; then
   cp fendl21.$T ../. 
   cp xsdir21.$T ../. 
fi; 




