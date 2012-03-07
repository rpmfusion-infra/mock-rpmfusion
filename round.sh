#!/bin/sh

ARCHES="arm"
FVERSION="15 17 rawhide"
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
for arch2 in armhfp ; do 
  cp fedora-${fver}-${arch}-${repo}.cfg fedora-${fver}-${arch2}-${repo}.cfg
  git add fedora-${fver}-${arch2}-${repo}.cfg
  sed -i -e "s|${arch}|${arch2}|g" fedora-${fver}-${arch2}-${repo}.cfg
  sed -i -e "s|armhfpv5tel', 'armhfpv6l', 'armhfpv7l|armv7l|g" fedora-${fver}-${arch2}-${repo}.cfg
  sed -i -e "s|armhfpv5tel|armhl|g" fedora-${fver}-${arch2}-${repo}.cfg
done

### /script
    done
  done
done 
