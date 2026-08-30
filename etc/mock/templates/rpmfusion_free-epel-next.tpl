config_opts['dnf.conf'] += """
[rpmfusion-free-next]
name=RPM Fusion for EL $releasever - Free - Next
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-next-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=1

[rpmfusion-free-next-debuginfo]
name=RPM Fusion for EL $releasever - Free - Next Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-el-next-released-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-next-released-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-next-source]
name=RPM Fusion for EL $releasever - Free - Next Source
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-next-released-source-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-next-testing]
name=RPM Fusion for EL $releasever - Free - Test Next
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-next-testing-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-next-testing-debuginfo]
name=RPM Fusion for EL $releasever - Free - Test Next Debug
#mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-el-next-testing-debug-$releasever&arch=$basearch
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-next-testing-debug-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=0

[rpmfusion-free-next-testing-source]
name=RPM Fusion for EL $releasever - Free - Test Next Source
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-next-testing-source-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=0

[local-free-next]
name=RPM Fusion for EL $releasever - Free - Next Local repo
baseurl=https://koji.rpmfusion.org/kojifiles/repos/el$releasever-free-next-build/latest/$basearch/
cost=2000
enabled=0

[buildsys-override-free-next]
name=RPM Fusion for EL $releasever - Free - Next Buildsys override
baseurl=https://koji.rpmfusion.org/buildsys-override/el$releasever-free-next/$basearch/
cost=2000
enabled=0
"""
