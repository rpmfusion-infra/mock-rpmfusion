# Source is created by
pushd ..
git clone https://github.com/rpm-software-management/mock.git
popd
pushd ../mock/mock-core-configs
git fetch
#git tag | grep mock-core-configs | tail -n1
git reset --hard $(git tag | grep mock-core-configs | tail -n1)
popd

Phase 2:
VERSION=37.2
MSG="F37 GA"
# Set VERSION on Makefile
sed -i "s/VERSION=.*/VERSION=$VERSION/" Makefile

Edit round.sh with BRANCHED="F38" and or edit el-round.sh ( for epel8 )

To have changelog , you may need run make to have mock-rpmfusion-free.spec
rpmdev-bumpspec -c "$MSG" mock-rpmfusion-free.spec
Edit CHANGELOG with result of rpmdev-bumpspec

To check if all good:
  make
  git status

To commit just code changes:
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
upload mock-rpmfusion-free-$VERSION.tar.bz2 and mock-rpmfusion-nonfree-$VERISON.tar.bz2

# checkout and pull mock-rpmfusion-free and mock-rpmfusion-nonfree (directories are hardcoded)
cd ../../mock-rpmfusion-free/
git checkout master
git pull
cd -
cd ../../nonfree/mock-rpmfusion-nonfree/
git checkout master
git pull
cd -

# free package:
diff mock-rpmfusion-free.spec ../../mock-rpmfusion-free/ -s
cp mock-rpmfusion-free.spec ../../mock-rpmfusion-free/
cd ../../mock-rpmfusion-free/
spectool -g mock-rpmfusion-free.spec
diff ./mock-rpmfusion-free-$VERSION.tar.bz2 ../rpmfusion-infra/mock-rpmfusion/ -s

#to test
rfpkg srpm && mock -r fedora-rawhide-x86_64-rpmfusion_free --no-clean --rebuild mock-rpmfusion-free-$VERSION-1.fc36.src.rpm

# Build
rfpkg new-sources ./mock-rpmfusion-free-$VERSION.tar.bz2
rfpkg ci -c
git show
rfpkg push && rfpkg build --nowait
cd -

# nonfree package:
diff mock-rpmfusion-nonfree.spec ../../nonfree/mock-rpmfusion-nonfree/ -s
cp mock-rpmfusion-nonfree.spec ../../nonfree/mock-rpmfusion-nonfree/
cd ../../nonfree/mock-rpmfusion-nonfree/
spectool -g mock-rpmfusion-nonfree.spec
diff ./mock-rpmfusion-nonfree-$VERSION.tar.bz2 ../../rpmfusion-infra/mock-rpmfusion/ -s

rfpkg new-sources ./mock-rpmfusion-nonfree-$VERSION.tar.bz2
rfpkg ci -c
git show
rfpkg push && rfpkg build --nowait

# Build other branches
git checkout f40 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout f39 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout f38 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el9 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el8 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el7 && git merge master && git push && rfpkg build --nowait; git checkout master
