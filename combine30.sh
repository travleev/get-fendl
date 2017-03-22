#!/bin/bash

./get_awr.sh "$@"

if [[ "0" -ne $? ]]; then 
    # previous script exited with an error.
    exit $?
fi    

cd ace30

# For some reasons, makxsf crashes on K-39. Remove it:
rm 19K_039.*

# prepare single xsdir from separate *.xdr files:
cat ../awr.xsdir *.xdr > xsdir.1 


# THe following commented code is to fix xsdir files for activation data. It is not needed currently, so I skip this.
# # ace/*.dir data contain 'filename' and 'route' instead of actual xslib name and 0. Fix this.
# # TODO: this approach does not take into account metastable nuclides. For example, Am242m is called
# #       in this set 92242, i.e. exactly as the nuclide in the ground state.
# for d in $(ls *[^m].dir); do
#     n=${d%.dir}
#     sed 's/filename/'$n'/g; s/route/0/g' $d >> fendl.xsdir
# done

dos2unix -q xsdir.1


# Prepare specs file for makxsf that is used to put all cross-sections into a single file
T=${2:-1}
sed "s/XX/30/g; s/T/$T/g" ../specs.head > specs  # specs line header
csplit -q xsdir.1 '/directory/1'
awk '{ print $1 }' xx01 >> specs       # list of nuclides
echo >> specs                          # final empty line

# run makxsf
rm xsdir30.$T fendl30.$T;
makxsf

# copy resulted files to current dir
if [ -f fendl30.$T ]; then
   cp fendl30.$T ../. 
   cp xsdir30.$T ../. 
fi; 





