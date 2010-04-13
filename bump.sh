#!/bin/sh


for arch in i386 x86_64 ppc ppc64 ; do
  for type in rpmfusion_free rpmfusion_nonfree kwizart ; do
    cp -p fedora-12-$arch-$type.cfg fedora-13-$arch-$type.cfg
    git add fedora-13-$arch-$type.cfg
  #Stable
    sed -i -e 's/12/13/g' fedora-13-$arch-$type.cfg
    #sed -i -e 's/f12/f13/g' fedora-13-$arch-$type.cfg
    #sed -i -e 's/fc12/fc13/g' fedora-13-$arch-$type.cfg
    #sed -i -e 's/Fedora 12/Fedora 13/g' fedora-13-$arch-$type.cfg
    #sed -i -e 's/Fedora 12/Fedora 13/g' fedora-rawhide-$arch-$type.cfg
  #Rawhide
    #sed -i -e 's/fc13/fc14/g' fedora-rawhide-$arch-$type.cfg
    sed -i -e 's/13/14/g' fedora-rawhide-$arch-$type.cfg
  done
done
