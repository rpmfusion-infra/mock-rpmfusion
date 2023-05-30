config_opts['dnf.conf'] += """
[rpmfusion-free]
name=RPM Fusion for Fedora $releasever - Free
#baseurl=https://download1.rpmfusion.org/free/fedora/releases/$releasever/Everything/$basearch/os/
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-fedora-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever
gpgcheck=1
enabled=1

[rpmfusion-free-debuginfo]
name=RPM Fusion for Fedora $releasever - Free - Debug
#baseurl=https://download1.rpmfusion.org/free/fedora/releases/$releasever/Everything/$basearch/debug/
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-fedora-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-updates]
name=RPM Fusion for Fedora $releasever - Free - Updates
#baseurl=https://download1.rpmfusion.org/free/fedora/updates/$releasever/$basearch/
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-fedora-updates-released-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-updates-debuginfo]
name=RPM Fusion for Fedora $releasever - Free - Updates Debug
#baseurl=https://download1.rpmfusion.org/free/fedora/updates/$releasever/$basearch/debug/
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-fedora-updates-released-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-updates-testing]
name=RPM Fusion for Fedora $releasever - Free - Test Updates
#baseurl=https://download1.rpmfusion.org/free/fedora/updates/testing/$releasever/$basearch/
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-testing-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-fedora-updates-testing-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever
gpgcheck=1
enabled=1

[rpmfusion-free-updates-testing-debuginfo]
name=RPM Fusion for Fedora $releasever - Free - Test Updates Debug
#baseurl=https://download1.rpmfusion.org/free/fedora/updates/testing/$releasever/$basearch/debug/
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-testing-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-fedora-updates-testing-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever
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
gpgkey=file:///usr/share/distribution-gpg-keys/fedora/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=True

[local-free]
name=RPM Fusion for Fedora $releasever - Free - Local repo
baseurl=https://koji.rpmfusion.org/kojifiles/repos/f$releasever-free-build/latest/$basearch/
cost=2000
enabled=0

[buildsys-override-free]
name=RPM Fusion for Fedora $releasever - Free - Buildsys override
baseurl=https://koji.rpmfusion.org/buildsys-override/f$releasever-free/$basearch/
cost=2000
enabled=0
"""

