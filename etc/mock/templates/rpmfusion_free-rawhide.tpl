config_opts['dnf.conf'] += """
[rpmfusion-free-rawhide]
name=RPM Fusion for Fedora Rawhide - Free
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-rawhide&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-fedora-rawhide&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-rawhide
gpgcheck=1
enabled=1

[rpmfusion-free-rawhide-debuginfo]
name=RPM Fusion for Fedora Rawhide - Free - Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-rawhide-debug&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-fedora-rawhide-debug&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-rawhide
gpgcheck=1
enabled=0

[fedora-cisco-openh264]
name=Fedora $releasever openh264 (From Cisco) - $basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-cisco-openh264-$releasever&arch=$basearch
type=rpm
enabled=1
metadata_expire=14d
repo_gpgcheck=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/fedora/RPM-GPG-KEY-fedora-$releasever-rawhide
skip_if_unavailable=True

[local-free]
name=RPM Fusion for Fedora Rawhide - Free - Local repo
baseurl=https://koji.rpmfusion.org/kojifiles/repos/f$releasever-free-build/latest/$basearch/
cost=2000
enabled=0

[buildsys-override-free]
name=RPM Fusion for Fedora $releasever - Free - Buildsys override
baseurl=https://koji.rpmfusion.org/buildsys-override/f$releasever-free/$basearch/
cost=2000
enabled=0
"""

