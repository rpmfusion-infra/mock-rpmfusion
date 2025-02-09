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

To check if all good:
  make
  git status

rpmdev-bumpspec -c "$MSG" mock-rpmfusion-free.spec
Edit CHANGELOG with result of rpmdev-bumpspec

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
REL_PATH_TO_PKG_FREE=../../new/mock-rpmfusion-free/
REL_PATH_TO_PKG_NONFREE=../../new/nonfree/mock-rpmfusion-nonfree/
REL_PATH_TO_PKG_FREE_INVERSE=../../infra/mock-rpmfusion/
REL_PATH_TO_PKG_NONFREE_INVERSE=../../../infra/mock-rpmfusion/

pushd $REL_PATH_TO_PKG_FREE
git checkout master
git pull
popd
pushd $REL_PATH_TO_PKG_FREE
git checkout master
git pull
popd

# free package:
diff mock-rpmfusion-free.spec $REL_PATH_TO_PKG_FREE -s
cp -f mock-rpmfusion-free.spec $REL_PATH_TO_PKG_FREE
pushd $REL_PATH_TO_PKG_FREE
spectool -g mock-rpmfusion-free.spec
diff ./mock-rpmfusion-free-$VERSION.tar.bz2 $REL_PATH_TO_PKG_FREE_INVERSE -s

#to test
rfpkg --release f41 mockbuild --default-mock-resultdir -N

# Build
rfpkg new-sources ./mock-rpmfusion-free-$VERSION.tar.bz2
rfpkg ci -c
git show
rfpkg push && rfpkg build --nowait
popd

# nonfree package:
diff mock-rpmfusion-nonfree.spec $REL_PATH_TO_PKG_NONFREE -s
cp mock-rpmfusion-nonfree.spec $REL_PATH_TO_PKG_NONFREE
pushd $REL_PATH_TO_PKG_NONFREE
spectool -g mock-rpmfusion-nonfree.spec
diff ./mock-rpmfusion-nonfree-$VERSION.tar.bz2 $REL_PATH_TO_PKG_NONFREE_INVERSE -s

rfpkg new-sources ./mock-rpmfusion-nonfree-$VERSION.tar.bz2
rfpkg ci -c
git show
rfpkg push && rfpkg build --nowait
popd

pushd $REL_PATH_TO_PKG_FREE
# Build other branches
git checkout f42 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout f41 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout f40 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el9 && git merge master && git push && rfpkg build --nowait; git checkout master
git checkout el8 && git merge master && git push && rfpkg build --nowait; git checkout master
popd
pushd $REL_PATH_TO_PKG_NONFREE
popd
