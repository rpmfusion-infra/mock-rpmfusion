#!/bin/sh

ARCHES="i386 x86_64 ppc ppc64 ppc64le"
FVERSION="5 6 7"
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

  flavour=epel
  ffver=$fver
  if [ ! -f /etc/mock/epel-${fver}-${arch}.cfg ] ; then
    echo "doesnt exit ${etc_mock}/epel-${fver}-${arch}.cfg"
    # removing obsoleted .cfg
    rm -f fedora-${fver}-${arch}-${repo}.cfg
    continue
  fi
  cp template_init epel-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|configuration_name|fedora-${fver}-${arch}.cfg|g" epel-${fver}-${arch}-${repo}.cfg
  cat rpmfusion-free-$flavour-template >> epel-${fver}-${arch}-${repo}.cfg
  if [ ! "$repo" = rpmfusion_free ] ; then
    cat rpmfusion-nonfree-$flavour-template >> epel-${fver}-${arch}-${repo}.cfg
  fi
  #cat rpmfusion-buildsys-epel-template >> epel-${fver}-${arch}-${repo}.cfg
  if [ "$repo" = kwizart ] ; then
    cat kwizart-epel-template >> epel-${fver}-${arch}-${repo}.cfg
  fi
  echo "\"\"\"" >> epel-${fver}-${arch}-${repo}.cfg
  #git add fedora-${fver}-${arch}-${repo}.cfg
  #sed -i -e "s|\$basearch|${arch}|g" epel-${fver}-${arch}-${repo}.cfg
  #sed -i -e "s|\$releasever|${fver}|g" epel-${fver}-${arch}-${repo}.cfg
  mv epel-${fver}-${arch}-${repo}.cfg etc/mock
  #sed -i -e "s|mirrorlist=http://mirrors.rpmfusion.org|#mirrorlist=http://mirrors.rpmfusion.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|kojipkgs.fedoraproject.org|sparc.koji.fedoraproject.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|#baseurl=http://download1.rpmfusion.org/nonfree/fedora/|baseurl=http://download1.rpmfusion.org/nonfree/fedora-secondary/|g" fedora-${fver}-${arch2}-${repo}.cfg
#done

### /script
    done
  done
done

