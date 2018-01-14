#!/bin/bash
#
# The Phantom stats-bot
#
# Collects and prints statistics about code
# e.g. lines of code, number of authors
#
# Written by Daniel Price, 2018-, daniel.price@monash.edu
#
pwd=$PWD;
phantomdir="$pwd/../";
outdir=$1;
if [ ! -e $phantomdir/scripts/$0 ]; then
   echo "Error: This script needs to be run from the phantom/scripts directory";
   exit;
fi
#-------------
# subroutines
#-------------
get_author_count()
{
  nauth=`cd $phantomdir; git shortlog -s -n | cut -f 2 | wc -l`;
  echo $nauth;
}
#
# run these in turn
#
datetag=`date "+%Y%m%d"`;
nauthors=$(get_author_count);
echo "Number of authors: $nauthors";
if [ "X$outdir" != "X" ]; then
   echo "Writing to $outdir/author_count.txt";
   echo $datetag $nauthors >> $outdir/author_count.txt;
fi
