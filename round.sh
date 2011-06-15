#!/bin/sh

ARCHES="i386"
FVERSION="13 14 15 rawhide"
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
for arch2 in 'arm s390x sparc sparc64' ; do 
cp fedora-${fver}-${arch}-${repo}.cfg \
  fedora-${fver}-${arch2}-${repo}.cfg
git add fedora-${fver}-${arch2}-${repo}.cfg
sed -i -e "s|${arch}|${arch2}|g" fedora-${fver}-${arch2}-${repo}.cfg
done

### /script
    done
  done
done 
