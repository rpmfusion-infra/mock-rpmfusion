#!/bin/sh

ARCHES="i386 x86_64 aarch64 armhfp ppc64 ppc64le s390x"
FVERSION="23 24 25 rawhide"
REPOS="rpmfusion_free rpmfusion_nonfree kwizart"
#cd .. ; git clone https://git.fedorahosted.org/git/mock.git ; cd mock
#git checkout devel
etc_mock=../mock/etc/mock
#to old config uncomment next line
#etc_mock=/etc/mock


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
    ffver=26
  fi
  if [ ! -f ${etc_mock}/fedora-${fver}-${arch}.cfg ] ; then
    echo "doesnt exit ${etc_mock}/fedora-${fver}-${arch}.cfg"
    # removing obsoleted .cfg
    rm -f fedora-${fver}-${arch}-${repo}.cfg
    continue
  fi
  cp template_init fedora-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|configuration_name|fedora-${fver}-${arch}.cfg|g" fedora-${fver}-${arch}-${repo}.cfg
  cat rpmfusion-free-$flavour-template >> fedora-${fver}-${arch}-${repo}.cfg
  if [ ! "$repo" = rpmfusion_free ] ; then
    cat rpmfusion-nonfree-$flavour-template >> fedora-${fver}-${arch}-${repo}.cfg
  fi
  if [ "$repo" = kwizart ] ; then
    cat kwizart-stable-template >> fedora-${fver}-${arch}-${repo}.cfg
  fi
  echo "\"\"\"" >> fedora-${fver}-${arch}-${repo}.cfg
  #git add fedora-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|\$basearch|${arch}|g" fedora-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|\$releasever|${fver}|g" fedora-${fver}-${arch}-${repo}.cfg
  if [  ! $arch == i386 -a ! $arch == x86_64 ] ; then
    if [ "$arch" == "armhfp" -a "${ffver}" -gt "19" ] ; then
        :
    else
        #echo sed it fedora-${fver}-${arch}-${repo}.cfg
        sed -i -e "s|free/fedora/|free/fedora-secondary/|g" fedora-${fver}-${arch}-${repo}.cfg
    fi
  fi
  mv fedora-${fver}-${arch}-${repo}.cfg etc/mock
  #sed -i -e "s|mirrorlist=http://mirrors.rpmfusion.org|#mirrorlist=http://mirrors.rpmfusion.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|kojipkgs.fedoraproject.org|sparc.koji.fedoraproject.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|#baseurl=http://download1.rpmfusion.org/nonfree/fedora/|baseurl=http://download1.rpmfusion.org/nonfree/fedora-secondary/|g" fedora-${fver}-${arch2}-${repo}.cfg
#done

### /script
    done
  done
done

