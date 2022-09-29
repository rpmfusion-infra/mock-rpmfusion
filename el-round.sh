#!/bin/sh

ARCHES="x86_64 aarch64 ppc64le"
FVERSION="7 8 9"
REPOS="rpmfusion_free rpmfusion_nonfree"
FLAVOUR="epel epel-next"
etc_mock=../mock/mock-core-configs/etc/mock
# uncomment the next line to compare mock fedora configurations on /etc/mock
# with mock rpmfusion configuration
#etc_mock=/etc/mock


for arch in $ARCHES ; do
  for repo in $REPOS ; do
    for fver in $FVERSION ; do
      for flavour in $FLAVOUR; do

#### script

  # RPMFusion el7 don't have aarch64 builders
  if [ "$arch" = "aarch64" ] && [ "${fver}" -lt "8" ] ; then
    continue
  fi
  # RPMFusion el7 don't have ppc64le builders
  if [ "$arch" = "ppc64le" ] && [ "${fver}" -lt "8" ] ; then
    continue
  fi
  # RPMFusion el8 don't have next repos
  if [ "$flavour" = "epel-next" ] && [ "${fver}" -lt "9" ] ; then
    continue
  fi
  # if $etc_mock directory exist check .cfg,
  if [ -d "${etc_mock}" ] && [ ! -f "${etc_mock}/${flavour}-${fver}-${arch}.cfg" ] ; then
    echo "doesnt exist ${etc_mock}/${flavour}-${fver}-${arch}.cfg"
    continue
  fi

  cfg_name_new="${flavour}+${repo}-${fver}-${arch}.cfg"
  if [ "$repo" = rpmfusion_free ] ; then
    echo "include('${flavour}-${fver}-${arch}.cfg')" > $cfg_name_new
    if [ "${flavour}" = "epel-next" ] ; then
      echo "include('templates/rpmfusion_free-epel.tpl')" >> $cfg_name_new
    fi
    echo "include('templates/rpmfusion_free-${flavour}.tpl')" >> $cfg_name_new
  fi
  if [ "$repo" = rpmfusion_nonfree ] ; then
    echo "include('${flavour}+rpmfusion_free-${fver}-${arch}.cfg')" > $cfg_name_new
    if [ "${flavour}" = "epel-next" ] ; then
      #echo "include('epel-next-${fver}-${arch}.cfg')" > $cfg_name_new
      echo "include('templates/rpmfusion_nonfree-epel.tpl')" >> $cfg_name_new
    fi
    echo "include('templates/rpmfusion_nonfree-${flavour}.tpl')" >> $cfg_name_new
  fi
# yum.conf on epel-7
  if [ "${fver}" -lt "8" ]; then
    # No Next repo before el8
    if [ "$flavour" = "epel-next" ] ; then
      continue
    else
      sed -i -e "s|epel.tpl|epel_yum.tpl|g" $cfg_name_new
    fi
  fi

  #git add fedora-${fver}-${arch}-${repo}.cfg
#  sed -i -e "s|\$basearch|${arch}|g" epel-${fver}-${arch}-${repo}.cfg
#  sed -i -e "s|\$releasever|${fver}|g" epel-${fver}-${arch}-${repo}.cfg
  #sed -i -e "s|mirrorlist=http://mirrors.rpmfusion.org|#mirrorlist=http://mirrors.rpmfusion.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|kojipkgs.fedoraproject.org|sparc.koji.fedoraproject.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|#baseurl=http://download1.rpmfusion.org/nonfree/fedora/|baseurl=http://download1.rpmfusion.org/nonfree/fedora-secondary/|g" fedora-${fver}-${arch2}-${repo}.cfg
#done

  mv $cfg_name_new etc/mock/
### /script
      done
    done
  done
done

