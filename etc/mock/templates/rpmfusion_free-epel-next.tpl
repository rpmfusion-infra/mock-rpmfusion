config_opts['dnf.conf'] += """
[rpmfusion-free-next]
name=RPM Fusion for EL $releasever - Free - Next
#baseurl=https://download1.rpmfusion.org/free/el/next/$releasever/$basearch/
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-next-$releasever&arch=$basearch
enabled=1

[rpmfusion-free-next-testing]
name=RPM Fusion for EL $releasever - Free - Test Next
#baseurl=https://download1.rpmfusion.org/free/el/next/testing/$releasever/$basearch/
metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-next-testing-$releasever&arch=$basearch
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
