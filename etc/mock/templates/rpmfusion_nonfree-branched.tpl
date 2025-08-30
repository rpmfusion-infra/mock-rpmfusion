config_opts['dnf.conf'] += """
[rpmfusion-nonfree]
name=RPM Fusion for Fedora $releasever - Nonfree
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever
gpgcheck=1
enabled=1

[rpmfusion-nonfree-debuginfo]
name=RPM Fusion for Fedora $releasever - Nonfree - Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever
gpgcheck=1
enabled=0

[rpmfusion-nonfree-source]
name=RPM Fusion for Fedora $releasever - NonFree - Source
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-source-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever
gpgcheck=1
enabled=0

[rpmfusion-nonfree-updates]
name=RPM Fusion for Fedora $releasever - Nonfree - Updates
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-updates-released-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever
gpgcheck=1
enabled=0

[rpmfusion-nonfree-updates-debuginfo]
name=RPM Fusion for Fedora $releasever - Nonfree - Updates Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-updates-released-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever
gpgcheck=1
enabled=0

[rpmfusion-nonfree-updates-source]
name=RPM Fusion for Fedora $releasever - Nonfree - Updates Source
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-updates-released-source-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever
gpgcheck=1
enabled=0

[rpmfusion-nonfree-updates-testing]
name=RPM Fusion for Fedora $releasever - Nonfree - Test Updates
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-testing-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-updates-testing-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever
gpgcheck=1
enabled=1

[rpmfusion-nonfree-updates-testing-debuginfo]
name=RPM Fusion for Fedora $releasever - Nonfree - Test Updates Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-testing-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-updates-testing-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever
gpgcheck=1
enabled=0

[rpmfusion-nonfree-updates-testing-source]
name=RPM Fusion for Fedora $releasever - Nonfree - Test Updates Source
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-updates-testing-source-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever
gpgcheck=1
enabled=0

[local-nonfree]
name=RPM Fusion for Fedora $releasever - Nonfree - Local repo
baseurl=https://koji.rpmfusion.org/kojifiles/repos/f$releasever-nonfree-build/latest/$basearch/
cost=2000
enabled=0

[buildsys-override-nonfree]
name=RPM Fusion for Fedora $releasever - Nonfree - Buildsys override
baseurl=https://koji.rpmfusion.org/buildsys-override/f$releasever-nonfree/$basearch/
cost=2000
enabled=0
"""

