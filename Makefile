VERSION = 15.1

release-free : 
	sed -e's|@VERSION@|${VERSION}|'\
		< mock-rpmfusion-free.spec.in \
		> mock-rpmfusion-free.spec
	cat CHANGELOG >> mock-rpmfusion-free.spec
	tar cjvf mock-rpmfusion-free-$(VERSION).tar.bz2 \
		fedora-*_free.cfg \
		epel-*_free.cfg \
		mock-rpmfusion-free.spec

release-nonfree : 
	sed -e's|@VERSION@|${VERSION}|'\
		< mock-rpmfusion-nonfree.spec.in \
		> mock-rpmfusion-nonfree.spec
	cat CHANGELOG >> mock-rpmfusion-nonfree.spec
	tar cjvf mock-rpmfusion-nonfree-$(VERSION).tar.bz2 \
		fedora-*_nonfree.cfg \
		epel-*_nonfree.cfg \
		mock-rpmfusion-nonfree.spec

release-kwizart :
	sed -e's|@VERSION@|${VERSION}|'\
		< mock-kwizart.spec.in \
		> mock-kwizart.spec
	cat CHANGELOG >> mock-kwizart.spec
	tar cjvf mock-kwizart-$(VERSION).tar.bz2 \
		fedora-*kwizart.cfg \
		epel-*kwizart.cfg \
		mock-kwizart*.spec

clean :	
	rm *.spec *.tar.bz2 *~

