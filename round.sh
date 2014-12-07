#!/bin/sh

ARCHES="i386 x86_64 aarch64 armhfp ppc ppc64 s390x"
FVERSION="18 19 20 21 rawhide"
REPOS="rpmfusion_free rpmfusion_nonfree kwizart"


for arch in $ARCHES ; do
  for repo in $REPOS ; do
    for fver in $FVERSION ; do

#### script

  flavour=stable
  ffver=$fver
  #if [ $fver = 21 ] ; then
  #  flavour=branched
  #fi
  if [ $fver = rawhide ] ; then
    flavour=rawhide
    ffver=22
  fi
  if [ ! -f /etc/mock/fedora-${fver}-${arch}.cfg ] ; then
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
  if [  ! $arch == i386 -a ! $arch == x86_64 ] ; then
    if [ $arch == armhfp -a $fver < 20 ] ; then
      sed -i -e "s|free/fedora/|free/fedora-secondary/|g" fedora-${fver}-${arch}-${repo}.cfg
    fi
  fi
  #sed -i -e "s|mirrorlist=http://mirrors.rpmfusion.org|#mirrorlist=http://mirrors.rpmfusion.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|kojipkgs.fedoraproject.org|sparc.koji.fedoraproject.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|#baseurl=http://download1.rpmfusion.org/nonfree/fedora/|baseurl=http://download1.rpmfusion.org/nonfree/fedora-secondary/|g" fedora-${fver}-${arch2}-${repo}.cfg
#done

### /script
    done
  done
done

