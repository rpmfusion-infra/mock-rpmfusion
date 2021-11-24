#!/bin/sh

ARCHES="x86_64 aarch64 ppc64le"
FVERSION="7 8"
REPOS="rpmfusion_free rpmfusion_nonfree kwizart"
FLAVOUR="epel"
etc_mock=../mock/mock-core-configs/etc/mock
# uncomment the next line to compare mock fedora configurations on /etc/mock
# with mock rpmfusion configuration
#etc_mock=/etc/mock


for arch in $ARCHES ; do
  for repo in $REPOS ; do
    for fver in $FVERSION ; do
      for flavour in $FLAVOUR; do

#### script
  ffver=$fver

  # removing obsoleted .cfg
  if [ ! -f ${etc_mock}/${flavour}-${fver}-${arch}.cfg ] ; then
    echo "doesnt exist ${etc_mock}/${flavour}-${fver}-${arch}.cfg"
    rm -f ${flavour}-${fver}-${arch}-${repo}.cfg
    continue
  fi
  # RPMFusion el7 don't have aarch64 builders
  if [ "$arch" == "aarch64" -a "${fver}" -lt "8" ] ; then
    continue
  fi
  # RPMFusion el7 don't have ppc64le builders
  if [ "$arch" == "ppc64le" -a "${fver}" -lt "8" ] ; then
    continue
  fi

  if [ "$repo" = rpmfusion_free ] ; then
    echo "include('${flavour}-${fver}-${arch}.cfg')" > ${flavour}-${fver}-${arch}-${repo}.cfg
    echo "include('templates/rpmfusion_free-${flavour}.tpl')" >> ${flavour}-${fver}-${arch}-${repo}.cfg
  fi
  if [ "$repo" = rpmfusion_nonfree ] ; then
    echo "include('${flavour}-${fver}-${arch}-rpmfusion_free.cfg')" > ${flavour}-${fver}-${arch}-${repo}.cfg
    echo "include('templates/rpmfusion_free-${flavour}.tpl')" >> ${flavour}-${fver}-${arch}-${repo}.cfg
  fi
  if [ "$repo" = kwizart ] ; then
    echo "include('${flavour}-${fver}-${arch}-rpmfusion_nonfree.cfg')" > ${flavour}-${fver}-${arch}-${repo}.cfg
    echo "include('templates/kwizart-${flavour}.tpl')" >> ${flavour}-${fver}-${arch}-${repo}.cfg
  fi
# yum.conf on epel-7
  if [ "${fver}" -lt "8" ]; then
    sed -i -e "s|epel.tpl|epel_yum.tpl|g" ${flavour}-${fver}-${arch}-${repo}.cfg
  fi

  #git add fedora-${fver}-${arch}-${repo}.cfg
#  sed -i -e "s|\$basearch|${arch}|g" epel-${fver}-${arch}-${repo}.cfg
#  sed -i -e "s|\$releasever|${fver}|g" epel-${fver}-${arch}-${repo}.cfg
  #sed -i -e "s|mirrorlist=http://mirrors.rpmfusion.org|#mirrorlist=http://mirrors.rpmfusion.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|kojipkgs.fedoraproject.org|sparc.koji.fedoraproject.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|#baseurl=http://download1.rpmfusion.org/nonfree/fedora/|baseurl=http://download1.rpmfusion.org/nonfree/fedora-secondary/|g" fedora-${fver}-${arch2}-${repo}.cfg
#done

  mv ${flavour}-${fver}-${arch}-${repo}.cfg etc/mock/
### /script
      done
    done
  done
done

