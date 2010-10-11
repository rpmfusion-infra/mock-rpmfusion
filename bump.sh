#!/bin/sh


for arch in i386 x86_64 ppc64 ; do
  for type in rpmfusion_free rpmfusion_nonfree kwizart ; do
    #cp -p fedora-13-$arch-$type.cfg fedora-14-$arch-$type.cfg
    cp -p epel-6-$arch.cfg epel-6-$arch-$type.cfg
    #git add fedora-14-$arch-$type.cfg
    git add epel-6-$arch-$type.cfg
  #Stable
    sed -i -e 's/13/14/g' fedora-14-$arch-$type.cfg
    #sed -i -e 's/f13/f14/g' fedora-14-$arch-$type.cfg
    #sed -i -e 's/fc13/fc14/g' fedora-14-$arch-$type.cfg
    #sed -i -e 's/Fedora 13/Fedora 14/g' fedora-14-$arch-$type.cfg
    #sed -i -e 's/Fedora 13/Fedora 14/g' fedora-rawhide-$arch-$type.cfg
  #Rawhide
    #sed -i -e 's/fc14/fc15/g' fedora-rawhide-$arch-$type.cfg
    #sed -i -e 's/14/15/g' fedora-rawhide-$arch-$type.cfg
  done
done
