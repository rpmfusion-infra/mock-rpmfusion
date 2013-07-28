#!/bin/sh

ARCHES="i386 x86_64 arm armhfp ppc ppc64 s390x"
FVERSION="16 17 18 19 rawhide"
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
#for arch2 in sparc sparc64 ; do
  flavour=stable
  ffver=$fver
  #if [ $fver = 19 ] ; then
  #  flavour=branched
  #fi
  if [ $fver = rawhide ] ; then
    flavour=rawhide
    ffver=20
  fi
  if [ $fver = 16 -a $arch = armhfp ] ; then
    continue
  fi
  cp /etc/mock/fedora-${fver}-${arch}.cfg fedora-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|^\"\"\"||g" fedora-${fver}-${arch}-${repo}.cfg
  cat rpmfusion-free-$flavour-template >> fedora-${fver}-${arch}-${repo}.cfg
  if [ ! "$repo" = rpmfusion_free ] ; then
    cat rpmfusion-nonfree-$flavour-template >> fedora-${fver}-${arch}-${repo}.cfg
  fi
  cat rpmfusion-buildsys-template >> fedora-${fver}-${arch}-${repo}.cfg
  if [ "$repo" = kwizart ] ; then
    cat kwizart-stable-template >> fedora-${fver}-${arch}-${repo}.cfg
  fi
  echo "\"\"\"" >> fedora-${fver}-${arch}-${repo}.cfg
  #git add fedora-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|\$basearch|${arch}|g" fedora-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|\$releasever|${fver}|g" fedora-${fver}-${arch}-${repo}.cfg
  if [  ! $arch = i386 -a ! $arch = x86_64 ] ; then
    sed -i -e "s|free/fedora/|free/fedora-secondary/|g" fedora-${fver}-${arch}-${repo}.cfg
  fi
  #sed -i -e "s|mirrorlist=http://mirrors.rpmfusion.org|#mirrorlist=http://mirrors.rpmfusion.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|kojipkgs.fedoraproject.org|sparc.koji.fedoraproject.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|#baseurl=http://download1.rpmfusion.org/nonfree/fedora/|baseurl=http://download1.rpmfusion.org/nonfree/fedora-secondary/|g" fedora-${fver}-${arch2}-${repo}.cfg
#done

### /script
    done
  done
done

