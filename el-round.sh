#!/bin/sh

ARCHES="i386 x86_64 ppc ppc64"
FVERSION="5 6 7"
REPOS="rpmfusion_free rpmfusion_nonfree kwizart"


for arch in $ARCHES ; do
  for repo in $REPOS ; do
    for fver in $FVERSION ; do

#### script

  flavour=epel
  ffver=$fver
  #if [ $fver = 21 ] ; then
  #  flavour=branched
  #fi
  if [ $fver = rawhide ] ; then
    flavour=rawhide
    ffver=21
  fi
  if [ $fver = 16 -a $arch = armhfp ] ; then
    continue
  fi
  cp /etc/mock/epel-${fver}-${arch}.cfg epel-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|^\"\"\"||g" epel-${fver}-${arch}-${repo}.cfg
  cat rpmfusion-free-$flavour-template >> epel-${fver}-${arch}-${repo}.cfg
  if [ ! "$repo" = rpmfusion_free ] ; then
    cat rpmfusion-nonfree-$flavour-template >> epel-${fver}-${arch}-${repo}.cfg
  fi
  cat rpmfusion-buildsys-epel-template >> epel-${fver}-${arch}-${repo}.cfg
  if [ "$repo" = kwizart ] ; then
    cat kwizart-epel-template >> epel-${fver}-${arch}-${repo}.cfg
  fi
  echo "\"\"\"" >> epel-${fver}-${arch}-${repo}.cfg
  #git add fedora-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|\$basearch|${arch}|g" epel-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|\$releasever|${fver}|g" epel-${fver}-${arch}-${repo}.cfg
  #sed -i -e "s|mirrorlist=http://mirrors.rpmfusion.org|#mirrorlist=http://mirrors.rpmfusion.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|kojipkgs.fedoraproject.org|sparc.koji.fedoraproject.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|#baseurl=http://download1.rpmfusion.org/nonfree/fedora/|baseurl=http://download1.rpmfusion.org/nonfree/fedora-secondary/|g" fedora-${fver}-${arch2}-${repo}.cfg
#done

### /script
    done
  done
done

