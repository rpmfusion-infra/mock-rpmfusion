VERSION = 26.0

default: update release-free release-nonfree release-kwizart

update:
	./round.sh
	./el-round.sh

release-free :
	sed -e's|@VERSION@|${VERSION}|'\
		< mock-rpmfusion-free.spec.in \
		> mock-rpmfusion-free.spec
	cat CHANGELOG >> mock-rpmfusion-free.spec
	tar cjf mock-rpmfusion-free-$(VERSION).tar.bz2 \
		etc/mock/fedora-*_free.cfg \
		etc/mock/epel-*_free.cfg \
		mock-rpmfusion-free.spec

release-nonfree :
	sed -e's|@VERSION@|${VERSION}|'\
		< mock-rpmfusion-nonfree.spec.in \
		> mock-rpmfusion-nonfree.spec
	cat CHANGELOG >> mock-rpmfusion-nonfree.spec
	tar cjf mock-rpmfusion-nonfree-$(VERSION).tar.bz2 \
		etc/mock/fedora-*_nonfree.cfg \
		etc/mock/epel-*_nonfree.cfg \
		mock-rpmfusion-nonfree.spec

release-kwizart :
	sed -e's|@VERSION@|${VERSION}|'\
		< mock-kwizart.spec.in \
		> mock-kwizart.spec
	cat CHANGELOG >> mock-kwizart.spec
	tar cjf mock-kwizart-$(VERSION).tar.bz2 \
		etc/mock/fedora-*kwizart.cfg \
		etc/mock/epel-*kwizart.cfg \
		mock-kwizart*.spec

clean :
	rm -rf *.spec *.tar.bz2 *~

