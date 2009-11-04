#!/bin/sh


for arch in i386 x86_64 ppc ppc64 ; do
  for type in rpmfusion_free rpmfusion_nonfree kwizart ; do
    cp -p fedora-11-$arch-$type.cfg fedora-12-$arch-$type.cfg
    git add fedora-12-$arch-$type.cfg
    sed -i -e 's/fedora-11/fedora-12/g' fedora-12-$arch-$type.cfg
    sed -i -e 's/f11/f12/g' fedora-12-$arch-$type.cfg
    sed -i -e 's/fc11/fc12/g' fedora-12-$arch-$type.cfg
    sed -i -e 's/Fedora 11/Fedora 12/g' fedora-12-$arch-$type.cfg
    sed -i -e 's/Fedora 11/Fedora 12/g' fedora-rawhide-$arch-$type.cfg
  #Rawhide
    sed -i -e 's/fc12/fc13/g' fedora-rawhide-$arch-$type.cfg
    sed -i -e 's/Fedora 12/Fedora 13/g' fedora-rawhide-$arch-$type.cfg
  done
done
