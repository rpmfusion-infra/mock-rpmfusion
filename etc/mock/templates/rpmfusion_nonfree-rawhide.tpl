config_opts['dnf.conf'] += """
[rpmfusion-nonfree-rawhide]
name=RPM Fusion for Fedora Rawhide - Nonfree
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-rawhide&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-rawhide&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-rawhide
gpgcheck=1
enabled=1

[rpmfusion-nonfree-rawhide-debuginfo]
name=RPM Fusion for Fedora Rawhide - Nonfree - Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-rawhide-debug&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-rawhide-debug&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-rawhide
gpgcheck=1
enabled=0

[rpmfusion-nonfree-rawhide-source]
name=RPM Fusion for Fedora Rawhide - NonFree - Source
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-rawhide-source&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-rawhide-source&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-rawhide
gpgcheck=1
enabled=0

[local-nonfree]
name=RPM Fusion for Fedora Rawhide - Nonfree - Local repo
baseurl=https://koji.rpmfusion.org/kojifiles/repos/f$releasever-nonfree-build/latest/$basearch/
cost=2000
enabled=0

[buildsys-override-nonfree]
name=RPM Fusion for Fedora $releasever - Nonfree - Buildsys override
baseurl=https://koji.rpmfusion.org/buildsys-override/f$releasever-nonfree/$basearch/
cost=2000
enabled=0
"""

