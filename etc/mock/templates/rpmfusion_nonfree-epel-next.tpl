config_opts['dnf.conf'] += """
[rpmfusion-nonfree-next]
name=RPM Fusion for EL $releasever - Nonfree - Next
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-next-$releasever&arch=$basearch
enabled=1

[rpmfusion-nonfree-next-testing]
name=RPM Fusion for EL $releasever - Nonfree - Test Next
metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-next-testing-$releasever&arch=$basearch
enabled=0

[local-nonfree-next]
name=RPM Fusion for EL $releasever - Nonfree - Next Local repo
baseurl=https://koji.rpmfusion.org/kojifiles/repos/el$releasever-nonfree-next-build/latest/$basearch/
cost=2000
enabled=0

[buildsys-override-nonfree-next]
name=RPM Fusion for EL $releasever - Nonfree - Next Buildsys override
baseurl=https://koji.rpmfusion.org/buildsys-override/el$releasever-nonfree-next/$basearch/
cost=2000
enabled=0
"""
