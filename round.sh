#!/bin/sh

ARCHES="i386 x86_64 aarch64 armhfp ppc64 ppc64le"
FVERSION="27 28 29 30"
BRANCHED=""
RAWHIDE="31"
REPOS="rpmfusion_free rpmfusion_nonfree kwizart"
etc_mock=../mock/mock-core-configs/etc/mock
#to old config uncomment next line
#etc_mock=/etc/mock


for arch in $ARCHES ; do
  for repo in $REPOS ; do
    for fver in $FVERSION $BRANCHED $RAWHIDE ; do

#### script

  flavour=stable
  fver_number=$fver
  fver_alt=$fver
  if [ $fver = "$BRANCHED" ] ; then
    flavour=branched
    if [ "$repo" = kwizart ] ; then
      flavour=stable
    fi
  fi
  if [ $fver = $RAWHIDE ] ; then
    flavour=rawhide
    # Comment fver_alt when RPMFusion rawhide is pointing to Fedora branched
    # or uncomment fver_alt when RPMFusion is branched like Fedora
    fver_alt=rawhide
    fver=rawhide
  fi
  if [ ! -f ${etc_mock}/fedora-${fver}-${arch}.cfg ] ; then
    echo "doesnt exist ${etc_mock}/fedora-${fver}-${arch}.cfg"
    # removing obsoleted .cfg
    rm -f fedora-${fver}-${arch}-${repo}.cfg
    continue
  fi
  cp template_init fedora-${fver}-${arch}-${repo}.cfg
  cat ${repo}-${flavour}-template >> fedora-${fver}-${arch}-${repo}.cfg
  if [ "$repo" = rpmfusion_free ] ; then
    sed -i -e "s|configuration_name|fedora-${fver_alt}-${arch}.cfg|g" fedora-${fver}-${arch}-${repo}.cfg
  fi
  if [ "$repo" = rpmfusion_nonfree ] ; then
    sed -i -e "s|configuration_name|fedora-${fver}-${arch}-rpmfusion_free.cfg|g" fedora-${fver}-${arch}-${repo}.cfg
  fi
  # to replace releasever in local repos of rawhide before add kwizart-stable-template to file
  sed -i -e "s|\$releasever|${fver_number}|g" fedora-${fver}-${arch}-${repo}.cfg
  if [ "$repo" = kwizart ] ; then
    sed -i -e "s|configuration_name|fedora-${fver}-${arch}-rpmfusion_nonfree.cfg|g" fedora-${fver}-${arch}-${repo}.cfg
  fi
  sed -i -e "s|\$basearch|${arch}|g" fedora-${fver}-${arch}-${repo}.cfg
  sed -i -e "s|\$releasever|${fver}|g" fedora-${fver}-${arch}-${repo}.cfg
  echo "\"\"\"" >> fedora-${fver}-${arch}-${repo}.cfg
  #if [  ! $arch == i386 -a ! $arch == x86_64 ] ; then
    #if [ "$arch" == "armhfp" -a "${fver_number}" -gt "19" ] ; then
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

