#! /bin/bash
#################################################################################
#     File Name           :     ScpGCLog.sh
#     Created By          :     xiaodi
#     Creation Date       :     [2014-09-29 20:29]
#     Last Modified       :     [2014-09-30 14:57]
#     Description         :      
#################################################################################


USER="xiaodi"
HOSTS="brick0 brick1 brick2 brick3 brick4 brick5 brick6"

for host in $HOSTS
do
    scp $USER@$host:/tmp/spark-xiaodi.gc Arkansol.GClog/$1_$host.gc &
done
