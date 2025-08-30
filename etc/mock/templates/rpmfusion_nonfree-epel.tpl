config_opts['dnf.conf'] += """
[rpmfusion-nonfree-updates]
name=RPM Fusion for EL $releasever - Nonfree - Updates
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-el-updates-released-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-updates-released-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$releasever
gpgcheck=1
enabled=1

[rpmfusion-nonfree-updates-debuginfo]
name=RPM Fusion for EL $releasever - Nonfree - Updates Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-el-updates-released-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-updates-released-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-nonfree-updates-source]
name=RPM Fusion for EL $releasever - Nonfree - Updates Source
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-updates-released-source-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-nonfree-updates-testing]
name=RPM Fusion for EL $releasever - Nonfree - Test Updates
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-el-updates-testing-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-updates-testing-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-nonfree-updates-testing-debuginfo]
name=RPM Fusion for EL $releasever - Nonfree - Test Updates Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-el-updates-testing-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-updates-testing-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-nonfree-updates-testing-source]
name=RPM Fusion for EL $releasever - Nonfree - Test Updates Source
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-updates-testing-source-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$releasever
gpgcheck=1
enabled=0

[local-nonfree]
name=RPM Fusion for EL $releasever - Nonfree - Local repo
baseurl=https://koji.rpmfusion.org/kojifiles/repos/el$releasever-nonfree-build/latest/$basearch/
cost=2000
enabled=0

[buildsys-override-nonfree]
name=RPM Fusion for EL $releasever - Nonfree - Buildsys override
baseurl=https://koji.rpmfusion.org/buildsys-override/el$releasever-nonfree/$basearch/
cost=2000
enabled=0
"""

