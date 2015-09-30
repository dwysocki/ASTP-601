#!/bin/bash
#
# Renames a group of badly named files to better names.
#
# Badly named files are kept in the `bad/` directory, and their names take
# the form `bad/IMAGE-SEPT-14-2015-%D.fits`, where %D is a number between
# 1 and 100.
#
# Better named files are written to the `good/` directory, and their names
# take the form `good/img_%DDDD.fit`, where %DDDD is a number between
# 0001 and 0100.

for i in `seq 1 100`; do
    cp bad/IMAGE-SEPT-14-2015-$i.fits good/img_`printf %04d $i`.fit;
done
