VERSION=38.1
RELEASE=1

.ONESHELL: # Applies to every targets in the file!

default: update release-free release-nonfree

realone: clean-before-update default

clean-before-update:
	rm -rf etc/mock/*cfg

update:
	mkdir -p etc/mock
	./round.sh
	./el-round.sh

release-free :
	# make links to short names of settings names in el
	# we may change the links to rhel, centos, alma, rocky or even centos-stream
	cd ./etc/mock/
	ln -srf alma+epel-8-aarch64.cfg epel-8-aarch64.cfg
	ln -srf alma+epel-8-ppc64le.cfg epel-8-ppc64le.cfg
	ln -srf alma+epel-8-x86_64.cfg epel-8-x86_64.cfg
	
	# no epel-next+rpmfusion-8 available
	#ln -srf centos-stream+epel-next-8-aarch64.cfg epel-next-8-aarch64.cfg
	#ln -srf centos-stream+epel-next-8-ppc64le.cfg epel-next-8-ppc64le.cfg
	#ln -srf centos-stream+epel-next-8-x86_64.cfg epel-next-8-x86_64.cfg
	
	ln -srf centos-stream+epel-9-aarch64.cfg epel-9-aarch64.cfg
	ln -srf centos-stream+epel-9-ppc64le.cfg epel-9-ppc64le.cfg
	ln -srf centos-stream+epel-9-s390x.cfg epel-9-s390x.cfg
	ln -srf centos-stream+epel-9-x86_64.cfg epel-9-x86_64.cfg
	
	ln -srf centos-stream+epel-next-9-aarch64.cfg epel-next-9-aarch64.cfg
	ln -srf centos-stream+epel-next-9-ppc64le.cfg epel-next-9-ppc64le.cfg
	ln -srf centos-stream+epel-next-9-s390x.cfg epel-next-9-s390x.cfg
	ln -srf centos-stream+epel-next-9-x86_64.cfg epel-next-9-x86_64.cfg
	cd -
	sed -e"s|@VERSION@|${VERSION}|; s|@RELEASE@|${RELEASE}|"\
		< mock-rpmfusion-free.spec.in \
		> mock-rpmfusion-free.spec
	cat CHANGELOG >> mock-rpmfusion-free.spec
	tar cjf mock-rpmfusion-free-$(VERSION).tar.bz2 \
		etc/mock/epel-8-*.cfg \
		etc/mock/epel-9-*.cfg \
		etc/mock/epel-next-9-*.cfg \
		etc/mock/*rpmfusion_free*.cfg \
		etc/mock/templates/rpmfusion_free*.tpl \
		mock-rpmfusion-free.spec

release-nonfree :
	sed -e"s|@VERSION@|${VERSION}|; s|@RELEASE@|${RELEASE}|"\
		< mock-rpmfusion-nonfree.spec.in \
		> mock-rpmfusion-nonfree.spec
	cat CHANGELOG >> mock-rpmfusion-nonfree.spec
	tar cjf mock-rpmfusion-nonfree-$(VERSION).tar.bz2 \
		etc/mock/*rpmfusion_nonfree*.cfg \
		etc/mock/templates/rpmfusion_nonfree*.tpl \
		mock-rpmfusion-nonfree.spec

clean :
	rm -rf *.spec *.tar.bz2 *~

