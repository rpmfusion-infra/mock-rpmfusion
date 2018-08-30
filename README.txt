# Source is created by
pushd ..
git clone https://github.com/rpm-software-management/mock.git
pushd mock/mock-core-configs
git reset --hard %{name}-%{version}
(example  git reset --hard mock-core-configs-29.2-1)
popd
popd
edit Makefile set Verison
edit round.sh (for epel 8 edit el-round.sh)
to have changelog
rpmdev-bumpspec -c "F29 Branch" mock-rpmfusion-free.spec
edit mock-rpmfusion-free.spec and copy differences to CHANGELOG
make
git status
rm -rf etc/mock/*
git checkout etc/mock/
git diff
git commit .
make realone (etc/mock deleted and regenerated)
git add etc/mock/*cfg
git commit .

