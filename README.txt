# Source is created by
pushd ..
git clone https://github.com/rpm-software-management/mock.git
popd
pushd ../mock/mock-core-configs
git pull
git tag | grep mock-core-configs | tail -n1
git reset --hard %{name}-%{version}
(example  git reset --hard mock-core-configs-29.2-1)
popd

Phase 2:
Set VERSION on Makefile
Edit round.sh and or edit el-round.sh ( for epel8 )
To have changelog , you may need run make to have mock-rpmfusion-free.spec
MSG="F33 GA"
rpmdev-bumpspec -c "$MSG" mock-rpmfusion-free.spec
Edit CHANGELOG with result of rpmdev-bumpspec
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
upload mock-kwizart-$VERSION.tar.bz2, mock-rpmfusion-free-$VERSION.tar.bz2 and mock-rpmfusion-nonfree-$VERISON.tar.bz2

Build free package:
cd ../../mock-rpmfusion-free/
git checkout master
git pull
cd -
cp mock-rpmfusion-free.spec ../../mock-rpmfusion-free/
cd ../../mock-rpmfusion-free/
spectool -g mock-rpmfusion-free.spec
diff ./mock-rpmfusion-free-$VERSION.tar.bz2 /home/sergio/rpmfusion/new/mock-rpmfusion-free/ -s
#to test
rfpkg srpm && mock -r fedora-32-x86_64-rpmfusion_free --no-clean --rebuild mock-rpmfusion-free-$VERSION-1.fc34.src.rpm
rfpkg new-sources ./mock-rpmfusion-free-$VERSION.tar.bz2 rpmfusion-server-ca.cert
rfpkg ci -c
git show
rfpkg push && rfpkg build --nowait
cd -

Build nonfree package:
cd /home/sergio/rpmfusion/new/nonfree/mock-rpmfusion-nonfree/
git checkout master
git pull
cd -
cp mock-rpmfusion-nonfree.spec /home/sergio/rpmfusion/new/nonfree/mock-rpmfusion-nonfree/
cd /home/sergio/rpmfusion/new/nonfree/mock-rpmfusion-nonfree/
spectool -g mock-rpmfusion-nonfree.spec
diff ./mock-rpmfusion-nonfree-$VERSION.tar.bz2 /home/sergio/rpmfusion/new/nonfree/mock-rpmfusion-nonfree/ -s
rfpkg new-sources ./mock-rpmfusion-nonfree-$VERSION.tar.bz2
rfpkg ci -c
git show
rfpkg push && rfpkg build --nowait

git checkout f33 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout f32 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout f31 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el8 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el7 && git merge master && git push && rfpkg build --nowait; git checkout master
