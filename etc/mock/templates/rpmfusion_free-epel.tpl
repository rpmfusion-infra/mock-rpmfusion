config_opts['dnf.conf'] += """
[rpmfusion-free-updates]
name=RPM Fusion for EL $releasever - Free - Updates
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-el-updates-released-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-updates-released-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=1

[rpmfusion-free-updates-debuginfo]
name=RPM Fusion for EL $releasever - Free - Updates Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-el-updates-released-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-updates-released-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-updates-source]
name=RPM Fusion for EL $releasever - Free - Updates Source
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-updates-released-source-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-updates-testing]
name=RPM Fusion for EL $releasever - Free - Test Updates
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-el-updates-testing-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-updates-testing-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-updates-testing-debuginfo]
name=RPM Fusion for EL $releasever - Free - Test Updates Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-el-updates-testing-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-updates-testing-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-updates-testing-source]
name=RPM Fusion for EL $releasever - Free - Test Updates Source
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-updates-testing-source-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=0

[local-free]
name=RPM Fusion for EL $releasever - Free - Local repo
baseurl=https://koji.rpmfusion.org/kojifiles/repos/el$releasever-free-build/latest/$basearch/
cost=2000
enabled=0

[buildsys-override-free]
name=RPM Fusion for EL $releasever - Free - Buildsys override
baseurl=https://koji.rpmfusion.org/buildsys-override/el$releasever-free/$basearch/
cost=2000
enabled=0
"""

