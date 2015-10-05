#!/bin/bash

# file containing raw photometry from AAVSO (cli arg #1)
raw_fname=$1
# file to save the JD and mag from V-band (cli arg #2)
aavso_V_fname=$2
# file to save plotypus output table to (cli arg #3)
table_fname=$3
# dir to save plots to (cli arg #4)
plot_dir=$4

# extract V-band observations
awk '
  function isnum(x){ return (x==x+0) }
  BEGIN {LS = "\t"}
  $5=="V" && isnum($1) && isnum($2) {print $1,$2}
' < $raw_fname > $aavso_V_fname

# use the Lomb Scargle periodogram to search for a period between 5.3 and 5.4
# days, then use Ordinary Least Squares (OLS) to fit a Fourier series to the
# data, using Baart's criterion to determine an optimal order between 2 and 5
plotypus -i $aavso_V_fname --output-plot-lightcurve $plot_dir \
  --min-period=5.3 --max-period=5.4 \
  --periodogram=Lomb_Scargle \
  --regressor=OLS \
  --selector=Baart \
  --fourier-degree 2 5 \
  > $table_fname
