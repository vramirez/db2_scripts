#convert db to online
if [ $# -eq 1 ]; then
    export LOGARCHMETH1=$1
    db2 list db directory| grep alias | awk -v mylog=$LOGARCHMETH1 '{print "mkdir -p "mylog "/"$4"/"}' | sh
    db2 list db directory| grep alias | awk -v mylog=$LOGARCHMETH1 '{print "db2 update db cfg for "$4" using LOGARCHMETH1 disk:"mylog "/"$4"/"}' | sh
    echo "backing up all dbs..."
    db2 list db directory| grep alias | awk '{print "db2 backup db "$4" compress "}' | sh
    
else
    echo "One argument required example: /root/log/archdir"
fi