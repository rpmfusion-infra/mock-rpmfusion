config_opts['dnf.conf'] += """
[rpmfusion-free-updates]
name=RPM Fusion for EL $releasever - Free - Updates
#baseurl=https://download1.rpmfusion.org/free/el/updates/$releasever/$basearch/
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-updates-released-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=1

[rpmfusion-free-updates-testing]
name=RPM Fusion for EL $releasever - Free - Test Updates
#baseurl=https://download1.rpmfusion.org/free/el/updates/testing/$releasever/$basearch/
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-updates-testing-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$releasever
gpgcheck=1
enabled=1

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

