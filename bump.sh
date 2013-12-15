#!/bin/sh

for arch in i386 x86_64 ppc ppc64 armhfp s390x sparc sparc64 ; do
  for type in rpmfusion_free rpmfusion_nonfree kwizart ; do
    cp -p fedora-19-$arch-$type.cfg fedora-20-$arch-$type.cfg
    #cp -p epel-6-$arch.cfg epel-6-$arch-$type.cfg
    git add fedora-20-$arch-$type.cfg
    #git add epel-6-$arch-$type.cfg
  #Stable
    sed -i -e 's/16/17/g' fedora-17-$arch-$type.cfg
    sed -i -e 's/f16/f17/g' fedora-17-$arch-$type.cfg
    sed -i -e 's/fc16/fc17/g' fedora-17-$arch-$type.cfg
    sed -i -e 's/Fedora 16/Fedora 17/g' fedora-17-$arch-$type.cfg
  #Rawhide
    sed -i -e 's/Fedora 17/Fedora 18/g' fedora-rawhide-$arch-$type.cfg
    sed -i -e 's/fc17/fc18/g' fedora-rawhide-$arch-$type.cfg
    sed -i -e 's/17/18/g' fedora-rawhide-$arch-$type.cfg
  done
done
