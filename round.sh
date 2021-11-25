#!/bin/sh

ARCHES="i386 x86_64 aarch64 armhfp ppc64le"
FVERSION="33 34 35"
BRANCHED=""
RAWHIDE="36"
REPOS="rpmfusion_free rpmfusion_nonfree"
etc_mock=../mock/mock-core-configs/etc/mock
# uncomment the next line to compare mock fedora configurations on /etc/mock
# with mock rpmfusion configuration
#etc_mock=/etc/mock


for arch in $ARCHES ; do
  for repo in $REPOS ; do
    for fver in $FVERSION $BRANCHED $RAWHIDE ; do

#### script

  flavour=stable
  fver_alt=$fver
  if [ "$fver" = "$BRANCHED" ] ; then
    flavour=branched
  fi
  if [ "$fver" = $RAWHIDE ] ; then
    flavour=rawhide
    # Comment fver_alt when RPMFusion rawhide is pointing to Fedora branched
    # or uncomment fver_alt when RPMFusion is branched like Fedora
    fver_alt=rawhide
    fver=rawhide
  fi

  # removing obsoleted .cfg
  if [ -d "${etc_mock}" ] && [ ! -f "${etc_mock}/fedora-${fver}-${arch}.cfg" ] ; then
    echo "doesnt exist ${etc_mock}/fedora-${fver}-${arch}.cfg"
    rm -f "fedora-${fver}-${arch}-${repo}.cfg"
    continue
  fi

  if [ "$repo" = rpmfusion_free ] ; then
    echo "include('fedora-${fver_alt}-${arch}.cfg')" > "fedora-${fver}-${arch}-${repo}.cfg"
    echo "include('templates/rpmfusion_free-${flavour}.tpl')" >> "fedora-${fver}-${arch}-${repo}.cfg"
  fi
  if [ "$repo" = rpmfusion_nonfree ] ; then
    echo "include('fedora-${fver}-${arch}-rpmfusion_free.cfg')" > "fedora-${fver}-${arch}-${repo}.cfg"
    echo "include('templates/rpmfusion_nonfree-${flavour}.tpl')" >> "fedora-${fver}-${arch}-${repo}.cfg"
  fi
#  sed -i -e "s|\$basearch|${arch}|g" fedora-${fver}-${arch}-${repo}.cfg
#  sed -i -e "s|\$releasever|${fver}|g" fedora-${fver}-${arch}-${repo}.cfg
  #if [  ! $arch == i386 -a ! $arch == x86_64 ] ; then
    #if [ "$arch" == "armhfp" -a "${fver_number}" -gt "19" ] ; then
    #    :
    #else
        #echo sed it fedora-${fver}-${arch}-${repo}.cfg
    #    sed -i -e "s|free/fedora/|free/fedora-secondary/|g" fedora-${fver}-${arch}-${repo}.cfg
    #fi
  #fi
  mv "fedora-${fver}-${arch}-${repo}.cfg" etc/mock/
  #git add etc/mock/fedora-${fver}-${arch}-${repo}.cfg
  #sed -i -e "s|mirrorlist=http://mirrors.rpmfusion.org|#mirrorlist=http://mirrors.rpmfusion.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|kojipkgs.fedoraproject.org|sparc.koji.fedoraproject.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|#baseurl=http://download1.rpmfusion.org/nonfree/fedora/|baseurl=http://download1.rpmfusion.org/nonfree/fedora-secondary/|g" fedora-${fver}-${arch2}-${repo}.cfg
#done

### /script
    done
  done
done

