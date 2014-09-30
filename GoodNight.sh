#!/bin/bash

cc () {
    export MASTER=spark://brick6:7077
    ./bin/run-example graphx.Analytics cc "$1" \
        --numEPart=$2 --partStrategy=$3 \
        2>&1 | tee $(date +"%Y%m%d-%H%M")_CC\_$2\_$3.txt;
}

ccsuite () {
    cc "$1" $2 EdgePartition2D 
    cc "$1" $2 HybridCut 
}

# specify filepath yourself
PR () {
    echo $5\_$1\_$2\_$3\_$4;
    export MASTER=spark://brick6:7077
    ./bin/run-example benchmark.GraphXPartition \
        "$1" $5 --numEPart=$2 --threshHold=$3 --reverse=$4 \
        --run=$6 --numIter=$7 --tol=$8 \
        2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$2\_$3\_$4.txt;
        #2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$1\_$2\_$3\_$4.txt;
}

# graph, paritions
suite () {	
    PR "$1" $2 0 false EdgePartition2D $3 0 0.01
    PR "$1" $2 100 false HybridCut $3 0 0.01
}

./sbin/start-master.sh
sleep 5;
for i in $(seq 4 2 24);
#for i in 4;
do
    echo ============================\ $i\ ==========================
    cp conf/$i.sh conf/spark-env.sh;
    rm -r work/*;
    ./sbin/start-slaves.sh;
    sleep 20;
#   suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" $(expr $i \* 6) true;
#   suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" $(expr $i \* 6) true;
#   suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" $(expr $i \* 6) true;
    ccsuite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" $(expr $i \* 6);
    ccsuite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" $(expr $i \* 6);
    ccsuite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" $(expr $i \* 6);
    ./sbin/stop-slaves.sh;
    sleep 5;
    ./sbin/stop-slaves.sh;
    sleep 5;
    notify GraphX_$i &
done
