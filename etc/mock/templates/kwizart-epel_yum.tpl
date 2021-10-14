config_opts['yum.conf'] += """
[kwizart]
name=kwizart for EL $releasever - $basearch - Base
baseurl=http://rpms.kwizart.net/el/$releasever/$basearch/
enabled=1

[kwizart-testing]
name=kwizart-testing for EL $releasever - $basearch - Base
baseurl=http://rpms.kwizart.net/el/testing/$releasever/$basearch/
enabled=0
"""

