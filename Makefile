VERSION=35.3
RELEASE=1

default: update release-free release-nonfree

realone: clean-before-update default

clean-before-update:
	rm -rf etc/mock/*cfg

update:
	./round.sh
	./el-round.sh

release-free :
	sed -e"s|@VERSION@|${VERSION}|; s|@RELEASE@|${RELEASE}|"\
		< mock-rpmfusion-free.spec.in \
		> mock-rpmfusion-free.spec
	cat CHANGELOG >> mock-rpmfusion-free.spec
	tar cjf mock-rpmfusion-free-$(VERSION).tar.bz2 \
		etc/mock/*_free.cfg \
		etc/mock/templates/rpmfusion_free*.tpl \
		mock-rpmfusion-free.spec

release-nonfree :
	sed -e"s|@VERSION@|${VERSION}|; s|@RELEASE@|${RELEASE}|"\
		< mock-rpmfusion-nonfree.spec.in \
		> mock-rpmfusion-nonfree.spec
	cat CHANGELOG >> mock-rpmfusion-nonfree.spec
	tar cjf mock-rpmfusion-nonfree-$(VERSION).tar.bz2 \
		etc/mock/*_nonfree.cfg \
		etc/mock/templates/rpmfusion_nonfree*.tpl \
		mock-rpmfusion-nonfree.spec

clean :
	rm -rf *.spec *.tar.bz2 *~

