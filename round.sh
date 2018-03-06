#!/bin/sh

ARCHES="i386 x86_64 aarch64 armhfp ppc64 ppc64le s390x"
FVERSION="26 27 28 rawhide"
REPOS="rpmfusion_free rpmfusion_nonfree kwizart"
#cd .. ; git clone https://github.com/rpm-software-management/mock ; cd mock
#git checkout devel
etc_mock=../mock/mock-core-configs/etc/mock/
#to old config uncomment next line
#etc_mock=/etc/mock


for arch in $ARCHES ; do
  for repo in $REPOS ; do
    for fver in $FVERSION ; do

#### script

  flavour=stable
  #ffver=$fver
  if [ $fver = 28 ] ; then
    flavour=branched
    if [ "$repo" = kwizart ] ; then
      flavour=stable
      #break
    fi
  fi
  if [ $fver = rawhide ] ; then
    flavour=rawhide
    #ffver=27
    fver_branch=29
  else
    fver_branch=$fver
  fi
  if [ ! -f ${etc_mock}/fedora-${fver}-${arch}.cfg ] ; then
    echo "doesnt exit ${etc_mock}/fedora-${fver}-${arch}.cfg"
    # removing obsoleted .cfg
    rm -f fedora-${fver}-${arch}-${repo}.cfg
    continue
  fi
  cp template_init fedora-${fver}-${arch}-${repo}.cfg
  cat ${repo}-${flavour}-template >> fedora-${fver}-${arch}-${repo}.cfg
  if [ "$repo" = rpmfusion_free ] ; then
    sed -i -e "s|configuration_name|fedora-${fver}-${arch}.cfg|g" fedora-${fver}-${arch}-${repo}.cfg
  fi
  if [ "$repo" = rpmfusion_nonfree ] ; then
    sed -i -e "s|configuration_name|fedora-${fver}-${arch}-rpmfusion_free.cfg|g" fedora-${fver}-${arch}-${repo}.cfg
  fi
  # to replace releasever in local repos of rawhide before add kwizart-stable-template to file
  sed -i -e "s|\$releasever|${fver_branch}|g" fedora-${fver}-${arch}-${repo}.cfg
  if [ "$repo" = kwizart ] ; then
    sed -i -e "s|configuration_name|fedora-${fver}-${arch}-rpmfusion_nonfree.cfg|g" fedora-${fver}-${arch}-${repo}.cfg
  fi
  sed -i -e "s|\$basearch|${arch}|g" fedora-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|\$releasever|${fver}|g" fedora-${fver}-${arch}-${repo}.cfg
  echo "\"\"\"" >> fedora-${fver}-${arch}-${repo}.cfg
  #if [  ! $arch == i386 -a ! $arch == x86_64 ] ; then
    #if [ "$arch" == "armhfp" -a "${ffver}" -gt "19" ] ; then
    #    :
    #else
        #echo sed it fedora-${fver}-${arch}-${repo}.cfg
    #    sed -i -e "s|free/fedora/|free/fedora-secondary/|g" fedora-${fver}-${arch}-${repo}.cfg
    #fi
  #fi
  mv fedora-${fver}-${arch}-${repo}.cfg etc/mock/
  #git add etc/mock/fedora-${fver}-${arch}-${repo}.cfg
  #sed -i -e "s|mirrorlist=http://mirrors.rpmfusion.org|#mirrorlist=http://mirrors.rpmfusion.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|kojipkgs.fedoraproject.org|sparc.koji.fedoraproject.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|#baseurl=http://download1.rpmfusion.org/nonfree/fedora/|baseurl=http://download1.rpmfusion.org/nonfree/fedora-secondary/|g" fedora-${fver}-${arch2}-${repo}.cfg
#done

### /script
    done
  done
done

