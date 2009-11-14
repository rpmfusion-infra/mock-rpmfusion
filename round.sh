#!/bin/sh

ARCHES="i386 x86_64 ppc ppc64"
FVERSION="8 9 10 11 12 rawhide"
#FVERSION=rawhide
REPOS="rpmfusion_free rpmfusion_nonfree kwizart"


for arch in $ARCHES ; do
  for repo in $REPOS ; do
    for fver in $FVERSION ; do

#### script
#while read line
#do 
#echo $line
#sed -i -e "s|\[local\]|$line\n\[local\]|" fedora-${fver}-${arch}-${repo}.cfg
#done < rpmfusion-buildsys-template

#sed -i -e "s|@arch@|${arch}|g" fedora-${fver}-${arch}-${repo}.cfg
#sed -i -e "s|@version@|${fver}|g" fedora-${fver}-${arch}-${repo}.cfg


### /script
    done
  done
done 
