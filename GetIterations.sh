#! /bin/bash
#################################################################################
#     File Name           :     GetIterations.sh
#     Created By          :     xd
#     Creation Date       :     [2014-09-28 09:56]
#     Last Modified       :     [2014-09-28 11:45]
#     Description         :      
#################################################################################

# usage ./GetIterations.sh "$(ls | grep Hybrid)"

foo () {
    # header
    echo $1 | awk -F'\_' '{print $2; print $3}';
    # data
    grep iteration $1 | grep -v strange | awk -F'[^0-9]*' '$0=$8';
}

for i in $1; 
do
    foo $i > tmp;
    tr '\n' '\t' < tmp;
    echo
done 2>/dev/null;
