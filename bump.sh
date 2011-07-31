#!/bin/sh


for arch in i386 x86_64 ppc ppc64 arm s390x sparc sparc64 ; do
  for type in rpmfusion_free rpmfusion_nonfree kwizart ; do
    cp -p fedora-15-$arch-$type.cfg fedora-16-$arch-$type.cfg
    #cp -p epel-6-$arch.cfg epel-6-$arch-$type.cfg
    git add fedora-16-$arch-$type.cfg
    #git add epel-6-$arch-$type.cfg
  #Stable
    sed -i -e 's/15/16/g' fedora-16-$arch-$type.cfg
    sed -i -e 's/f15/f16/g' fedora-16-$arch-$type.cfg
    sed -i -e 's/fc15/fc16/g' fedora-16-$arch-$type.cfg
    sed -i -e 's/Fedora 15/Fedora 16/g' fedora-16-$arch-$type.cfg
  #Rawhide
    sed -i -e 's/Fedora 16/Fedora 17/g' fedora-rawhide-$arch-$type.cfg
    sed -i -e 's/fc16/fc17/g' fedora-rawhide-$arch-$type.cfg
    sed -i -e 's/16/17/g' fedora-rawhide-$arch-$type.cfg
  done
done
