config_opts['dnf.conf'] += """
[kwizart]
name=kwizart for Fedora rawhide - $basearch - Base
baseurl=http://rpms.kwizart.net/fedora/rawhide/$basearch/
enabled=1

[kwizart-proprio]
name=kwizart-proprio for Fedora rawhide - $basearch - Base
baseurl=http://rpms.kwizart.net/fedora/proprio/rawhide/$basearch/
enabled=0

[kwizart-proprio-common]
name=kwizart-proprio for Fedora
baseurl=http://rpms.kwizart.net/fedora/proprio/common/
enabled=0

[kwizart-pending]
name=kwizart-pending for Fedora rawhide - $basearch - Base
baseurl=http://rpms.kwizart.net/fedora/pending/rawhide/
enabled=0
"""

