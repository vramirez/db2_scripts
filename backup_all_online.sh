db2 list db directory| grep alias | awk '{print "db2 backup db "$4" online compress  include logs "}' | sh
