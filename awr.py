# read awr and print in format, compatible with xsdirconvert.pl (script for converting mcnp xsdir to serpent format)

from __future__ import print_function
from sys import argv

# Assume that an existing xsdir file containing the AWR section is given as the
# command line argument to this script.

in_awr_block = False
for l in open(argv[1], 'r'):
    if not in_awr_block:
        if 'atomic' in l:
            # The AWR block starts with a line containing 'atomic weight ratios'
            in_awr_block = True
    else:
        if '/' in l or 'dir' in l:
            # The AWR block ends with a line containing date in the DD/MM/YYYY
            # format, following with a line containing 'directory'
            break
        else:
            t = l.split()
            for t1, t2 in zip(t[:-1:2], t[1::2]):
                print(t1, t2)



