#!/bin/sh

ARCHES="i386 x86_64 aarch64 armhfp ppc64le"
FVERSION="40 41 42"
BRANCHED=""
RAWHIDE="43"
REPOS="rpmfusion_free rpmfusion_nonfree"
etc_mock=../mock/mock-core-configs/etc/mock
# uncomment the next line to compare mock fedora configurations on /etc/mock
# with mock rpmfusion configuration
#etc_mock=/etc/mock


for arch in $ARCHES ; do
  for repo in $REPOS ; do
    for fver in $FVERSION $BRANCHED $RAWHIDE ; do

#### script

  # RPMFusion f37 don't have armhfp builders
  if [ "$arch" = "armhfp" ] && [ "${fver}" -ge "37" ] ; then
    continue
  fi

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

  # if $etc_mock directory exist, check .cfg files
  if [ -d "${etc_mock}" ] && [ ! -f "${etc_mock}/fedora-${fver}-${arch}.cfg" ] ; then
    echo "doesnt exist ${etc_mock}/fedora-${fver}-${arch}.cfg"
    continue
  fi

  cfg_name_new="fedora+${repo}-${fver}-${arch}.cfg"
  cfg_name_old="fedora-${fver}-${arch}-${repo}.cfg"
  if [ "$repo" = rpmfusion_free ] ; then
    echo "include('fedora-${fver_alt}-${arch}.cfg')" > "$cfg_name_new"
    echo "include('templates/rpmfusion_free-${flavour}.tpl')" >> "$cfg_name_new"
  fi
  if [ "$repo" = rpmfusion_nonfree ] ; then
    echo "include('fedora+rpmfusion_free-${fver}-${arch}.cfg')" > "$cfg_name_new"
    echo "include('templates/rpmfusion_nonfree-${flavour}.tpl')" >> "$cfg_name_new"
  fi
#  sed -i -e "s|\$basearch|${arch}|g" fedora+${fver}-${arch}-${repo}.cfg
#  sed -i -e "s|\$releasever|${fver}|g" fedora-${fver}-${arch}-${repo}.cfg
  #if [  ! $arch == i386 -a ! $arch == x86_64 ] ; then
    #if [ "$arch" == "armhfp" -a "${fver_number}" -gt "19" ] ; then
    #    :
    #else
        #echo sed it fedora-${fver}-${arch}-${repo}.cfg
    #    sed -i -e "s|free/fedora/|free/fedora-secondary/|g" fedora-${fver}-${arch}-${repo}.cfg
    #fi
  #fi
  ln -sr "$cfg_name_new" "$cfg_name_old"
  mv "$cfg_name_old" etc/mock/
  mv "$cfg_name_new" etc/mock/
  #git add etc/mock/fedora-${fver}-${arch}-${repo}.cfg
  #sed -i -e "s|mirrorlist=http://mirrors.rpmfusion.org|#mirrorlist=http://mirrors.rpmfusion.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|kojipkgs.fedoraproject.org|sparc.koji.fedoraproject.org|g" fedora-${fver}-${arch2}-${repo}.cfg
  #sed -i -e "s|#baseurl=http://download1.rpmfusion.org/nonfree/fedora/|baseurl=http://download1.rpmfusion.org/nonfree/fedora-secondary/|g" fedora-${fver}-${arch2}-${repo}.cfg
#done

### /script
    done
  done
done

