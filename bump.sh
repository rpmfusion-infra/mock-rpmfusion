#!/bin/sh


for arch in i386 x86_64 ppc64 ; do
  for type in rpmfusion_free rpmfusion_nonfree kwizart ; do
    cp -p fedora-14-$arch-$type.cfg fedora-15-$arch-$type.cfg
    #cp -p epel-6-$arch.cfg epel-6-$arch-$type.cfg
    git add fedora-15-$arch-$type.cfg
    #git add epel-6-$arch-$type.cfg
  #Stable
    sed -i -e 's/14/15/g' fedora-15-$arch-$type.cfg
    sed -i -e 's/f14/f15/g' fedora-15-$arch-$type.cfg
    sed -i -e 's/fc14/fc15/g' fedora-15-$arch-$type.cfg
    sed -i -e 's/Fedora 14/Fedora 15/g' fedora-15-$arch-$type.cfg
    sed -i -e 's/Fedora 14/Fedora 15/g' fedora-rawhide-$arch-$type.cfg
  #Rawhide
  #  sed -i -e 's/fc15/fc16/g' fedora-rawhide-$arch-$type.cfg
  #  sed -i -e 's/15/16/g' fedora-rawhide-$arch-$type.cfg
  done
done
