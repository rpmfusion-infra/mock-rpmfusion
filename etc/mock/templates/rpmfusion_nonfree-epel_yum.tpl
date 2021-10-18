config_opts['yum.conf'] += """
[rpmfusion-nonfree-updates]
name=RPM Fusion for EL $releasever - Nonfree - Updates
#baseurl=https://download1.rpmfusion.org/nonfree/el/updates/$releasever/$basearch/
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-updates-released-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$releasever
gpgcheck=1
enabled=1

[rpmfusion-nonfree-updates-testing]
name=RPM Fusion for EL $releasever - Nonfree - Test Updates
#baseurl=https://download1.rpmfusion.org/nonfree/el/updates/testing/$releasever/$basearch/
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-updates-testing-$releasever&arch=$basearch
gpgkey=file:///usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$releasever
gpgcheck=1
enabled=1

[local-nonfree]
name=RPM Fusion for EL $releasever - NonFree - Local repo
baseurl=https://koji.rpmfusion.org/kojifiles/repos/el$releasever-nonfree/latest/$basearch/
cost=2000
enabled=0

[buildsys-override-nonfree]
name=RPM Fusion for EL $releasever - NonFree - Buildsys override
baseurl=https://koji.rpmfusion.org/buildsys-override/el$releasever-nonfree/$basearch/
cost=2000
enabled=0
"""

