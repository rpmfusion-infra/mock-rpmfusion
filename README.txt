# Source is created by
pushd ..
git clone https://github.com/rpm-software-management/mock.git
pushd mock/mock-core-configs
git reset --hard %{name}-%{version}
(example  git reset --hard mock-core-configs-29.2-1)
popd
popd

Phase 2:
edit Makefile set VERSION
edit round.sh (for epel 8 edit el-round.sh)
to have changelog
rpmdev-bumpspec -c "F29 Branch" mock-rpmfusion-free.spec
edit mock-rpmfusion-free.spec and copy differences to CHANGELOG
- check if all good:
make
git status
- commit just code changes:
rm -rf etc/mock/*
git checkout etc/mock/
git diff
git commit .

make realone (etc/mock deleted and regenerated)
git add etc/mock/*cfg
git commit .

Go to github and add a new release
tag equal to Makefile VERSION
VERSION=29.1
upload mock-kwizart-$VERSION.tar.bz2, mock-rpmfusion-free-$VERSION.tar.bz2 and mock-rpmfusion-nonfree-$VERISON.tar.bz2

Build packages
cd ../../mock-rpmfusion-free/
git checkout master
git pull
cd -
cp mock-rpmfusion-free.spec ../../mock-rpmfusion-free/
cd ../../mock-rpmfusion-free/
spectool -g mock-rpmfusion-free.spec
diff ./mock-rpmfusion-free-$VERSION.tar.bz2 /home/sergio/rpmfusion/new/mock-rpmfusion-free/
#to test
rfpkg srpm && mock -r fedora-27-x86_64-rpmfusion_free --no-clean --rebuild mock-rpmfusion-free-$VERSION-1.fc30.src.rpm
rfpkg new-sources ./mock-rpmfusion-free-$VERSION.tar.bz2
rfpkg ci -c
git show
rfpkg push && rfpkg build

cd /home/sergio/rpmfusion/new/nonfree/mock-rpmfusion-nonfree/
git checkout master
git pull
cd -
cp mock-rpmfusion-nonfree.spec /home/sergio/rpmfusion/new/nonfree/mock-rpmfusion-nonfree/
cd /home/sergio/rpmfusion/new/nonfree/mock-rpmfusion-nonfree/
spectool -g mock-rpmfusion-nonfree.spec
diff ./mock-rpmfusion-nonfree-$VERSION.tar.bz2 /home/sergio/rpmfusion/new/nonfree/mock-rpmfusion-nonfree/
rfpkg new-sources ./mock-rpmfusion-nonfree-$VERSION.tar.bz2
rfpkg ci -c
git show
rfpkg push && rfpkg build
cat ../../hist.txt
git checkout f29 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout f28 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout f27 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el7 && git merge master && git push && rfpkg build --nowait; git checkout master
