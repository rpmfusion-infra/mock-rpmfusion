# Source is created by
pushd ..
git clone https://github.com/rpm-software-management/mock.git
popd
pushd ../mock/mock-core-configs
git pull
git tag | grep mock-core-configs | tail -n1
git reset --hard %{name}-%{version}
(example:  git reset --hard mock-core-configs-29.2-1)
popd

Phase 2:
Set VERSION on Makefile
Edit round.sh and or edit el-round.sh ( for epel8 )
To have changelog , you may need run make to have mock-rpmfusion-free.spec
MSG="F33 GA"
rpmdev-bumpspec -c "$MSG" mock-rpmfusion-free.spec
Edit CHANGELOG with result of rpmdev-bumpspec
etc_mock=../mock/mock-core-configs/etc/mock
cd $etc_mock/
ln -srf alma+epel-8-aarch64.cfg epel-8-aarch64.cfg
ln -srf alma+epel-8-ppc64le.cfg epel-8-ppc64le.cfg
ln -srf alma+epel-8-x86_64.cfg epel-8-x86_64.cfg
# no epel-next+rpmfusion-8 available
ln -srf centos-stream+epel-9-aarch64.cfg epel-9-aarch64.cfg
ln -srf centos-stream+epel-9-ppc64le.cfg epel-9-ppc64le.cfg
ln -srf centos-stream+epel-9-s390x.cfg epel-9-s390x.cfg
ln -srf centos-stream+epel-9-x86_64.cfg epel-9-x86_64.cfg
ln -srf centos-stream+epel-next-9-aarch64.cfg epel-next-9-aarch64.cfg
ln -srf centos-stream+epel-next-9-ppc64le.cfg epel-next-9-ppc64le.cfg
ln -srf centos-stream+epel-next-9-s390x.cfg epel-next-9-s390x.cfg
ln -srf centos-stream+epel-next-9-x86_64.cfg epel-next-9-x86_64.cfg
To check if all good:
  make
  git status
TO commit just code changes:
  git checkout etc/mock/
  git diff
  git commit . -m "$MSG"

To commit the generated configurations:
  make realone (etc/mock deleted and regenerated)
  git add etc/mock/*cfg
  git commit . -m "Generated files"
  git push

Phase 3:
Go to https://github.com/rpmfusion-infra/mock-rpmfusion/releases and add a new release
tag equal to Makefile VERSION

Set bash terminal the actual version that we want to build for example:
VERSION=32.2
upload mock-rpmfusion-free-$VERSION.tar.bz2 and mock-rpmfusion-nonfree-$VERISON.tar.bz2

# Build free package:
cd ../../mock-rpmfusion-free/
git checkout master
git pull
cd -
diff mock-rpmfusion-free.spec ../../mock-rpmfusion-free/ -s
cp mock-rpmfusion-free.spec ../../mock-rpmfusion-free/
cd ../../mock-rpmfusion-free/
spectool -g mock-rpmfusion-free.spec
diff ./mock-rpmfusion-free-$VERSION.tar.bz2 ../rpmfusion-infra/mock-rpmfusion/ -s

#to test
rfpkg srpm && mock -r fedora-rawhide-x86_64-rpmfusion_free --no-clean --rebuild mock-rpmfusion-free-$VERSION-1.fc36.src.rpm
rfpkg new-sources ./mock-rpmfusion-free-$VERSION.tar.bz2
rfpkg ci -c
git show
rfpkg push && rfpkg build --nowait
cd -

# Build nonfree package:
cd ../../nonfree/mock-rpmfusion-nonfree/
git checkout master
git pull
cd -
diff mock-rpmfusion-nonfree.spec ../../nonfree/mock-rpmfusion-nonfree/ -s
cp mock-rpmfusion-nonfree.spec ../../nonfree/mock-rpmfusion-nonfree/
cd ../../nonfree/mock-rpmfusion-nonfree/
spectool -g mock-rpmfusion-nonfree.spec
diff ./mock-rpmfusion-nonfree-$VERSION.tar.bz2 ../../rpmfusion-infra/mock-rpmfusion/ -s

rfpkg new-sources ./mock-rpmfusion-nonfree-$VERSION.tar.bz2
rfpkg ci -c
git show
rfpkg push && rfpkg build --nowait

git checkout f37 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout f36 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout f35 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el9 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el8 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el7 && git merge master && git push && rfpkg build --nowait; git checkout master
