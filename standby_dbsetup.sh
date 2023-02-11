DBNAME=$1
REMOTE_HOST=$2
REMOTE_INST=$3
HADRPORT=$4
LOCALHOST=`hostname`
db2 update db cfg for $DBNAME using HADR_LOCAL_HOST $LOCALHOST
db2 update db cfg for $DBNAME using HADR_REMOTE_HOST $REMOTE_HOST
db2 update db cfg for $DBNAME using HADR_LOCAL_SVC $HADRPORT
db2 update db cfg for $DBNAME using HADR_REMOTE_SVC $HADRPORT
db2 update db cfg for $DBNAME using LOGINDEXBUILD on
db2 update db cfg for $DBNAME using HADR_TIMEOUT 120
db2 update db cfg for $DBNAME using HADR_PEER_WINDOW 120
db2 update db cfg for $DBNAME using HADR_REMOTE_INST $REMOTE_INST
db2 start hadr on db $DBNAME as standby
