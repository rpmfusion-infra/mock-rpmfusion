#!/bin/sh

ARCHES="x86_64 aarch64 ppc64 ppc64le"
FVERSION="7 8"
REPOS="rpmfusion_free rpmfusion_nonfree kwizart"
etc_mock=../mock/mock-core-configs/etc/mock
#to old config uncomment next line
#etc_mock=/etc/mock


for arch in $ARCHES ; do
  for repo in $REPOS ; do
    for fver in $FVERSION ; do

#### script

  flavour=epel
  ffver=$fver
  if [ ! -f ${etc_mock}/epel-${fver}-${arch}.cfg ] ; then
    echo "doesnt exist ${etc_mock}/epel-${fver}-${arch}.cfg"
    # removing obsoleted .cfg
    rm -f epel-${fver}-${arch}-${repo}.cfg
    continue
  fi
  # RPMFusion el7 don't have aarch64 builders
  if [ "$arch" == "aarch64" -a "${fver}" -lt "8" ] ; then
    continue
  fi
  if [ "${fver}" -lt "8" ]; then
      cp template_yum_init epel-${fver}-${arch}-${repo}.cfg
  else
      cp template_init epel-${fver}-${arch}-${repo}.cfg
  fi
  sed -i -e "s|configuration_name|epel-${fver}-${arch}.cfg|g" epel-${fver}-${arch}-${repo}.cfg
  cat rpmfusion_free-$flavour-template >> epel-${fver}-${arch}-${repo}.cfg
  if [ ! "$repo" = rpmfusion_free ] ; then
    cat rpmfusion_nonfree-$flavour-template >> epel-${fver}-${arch}-${repo}.cfg
  fi
  #cat rpmfusion-buildsys-epel-template >> epel-${fver}-${arch}-${repo}.cfg
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

  mv epel-${fver}-${arch}-${repo}.cfg etc/mock/
### /script
    done
  done
done

