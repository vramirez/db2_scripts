USER_INST=db2inst1
USER_FENC=db2fenc1
GRP_INST=db2iadm1
GRP_FENC=db2fadm1
DB2_PORT=52000
LOGDIR=/logdir
groupadd $GRP_INST
groupadd $GRP_FENC
useradd -m -g $GRP_INST $USER_INST
useradd -m -g $GRP_FENC $USER_FENC
INSTALLER_HOME=$1
DB2_ENGINE_PATH=$2
dnf install -y python2 patch make perl kernel-devel gcc-c++ cpp binutils gcc ksh pam-devel.i686 libstdc++.i686
mkdir -p $DB2_ENGINE_PATH
$INSTALLER_HOME/db2_install -b $DB2_ENGINE_PATH -p SERVER  -y -n -l /tmp/db2_install_by_victor.log
$DB2_ENGINE_PATH/instance/db2icrt -p $DB2_PORT -u $USER_FENC $USER_INST
