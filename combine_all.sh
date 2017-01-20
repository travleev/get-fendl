#!/bin/bash

cat xsdir30 > xsdir
csplit -q xsdir21 '/directory/1'
cat xx01 >> xsdir
rm xx??

