db2 list db directory| grep alias | awk '{print "db2 deactivate db "$4}'  | sh
db2 list db directory| grep alias | awk '{print "db2 stop hadr on db "$4}'  | sh
