db2 list db directory| grep alias | awk '{print "db2 start hadr on db "$4" as primary"}'  | sh
