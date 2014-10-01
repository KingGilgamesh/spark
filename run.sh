#!/bin/bash


# local fs
foolocal () {
    echo $5\_$1\_$2\_$3\_$4;
    export MASTER=spark://brick0:7077
    ./bin/run-example benchmark.GraphXPartition \
        /data/sdc1/xiaodi/data/$1 $5 --numEPart=$2 --threshHold=$3 --reverse=$4 \
        --run=$6 --numIter=$7 --tol=$8 \
        2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$1\_$2\_$3\_$4.txt;
}

# specify filepath yourself
PR () {
    echo $5\_$1\_$2\_$3\_$4;
    export MASTER=spark://brick0:7077
    ./bin/run-example benchmark.GraphXPartition \
        "$1" $5 --numEPart=$2 --threshHold=$3 --reverse=$4 \
        --run=$6 --numIter=$7 --tol=$8 \
        2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$2\_$3\_$4\_$9.txt;
    #2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$1\_$2\_$3\_$4.txt;
    ./ScpGCLog.sh $(date +"%Y%m%d-%H%M")_$5\_$2\_$3\_$4\_$9;
}

# hdfs
foo () {
    echo $5\_$1\_$2\_$3\_$4;
    export MASTER=spark://brick0:7077
    ./bin/run-example benchmark.GraphXPartition \
        hdfs://sjx-ipads:54310/dataset/$1 $5 --numEPart=$2 --threshHold=$3 --reverse=$4 \
        --run=$6 --numIter=$7 --tol=$8 \
        2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$2\_$3\_$4.txt;
    #2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$1\_$2\_$3\_$4.txt;
}

cclocal () {
    export MASTER=spark://brick0:7077
    ./bin/run-example graphx.Analytics cc /data/sdc1/xiaodi/data/$1 \
        --numEPart=$2 --partStrategy=$3 \
        2>&1 | tee $(date +"%Y%m%d-%H%M")_CC\_$1\_$2\_$3.txt;
}
cc () {
    export MASTER=spark://brick0:7077
    ./bin/run-example graphx.Analytics cc "$1" \
        --numEPart=$2 --partStrategy=$3 \
        2>&1 | tee $(date +"%Y%m%d-%H%M")_CC\_$2\_$3\_$4.txt;
}

ccsuite () {
    cc "$1" $2 EdgePartition2D "$3"
    cc "$1" $2 HybridCut "$3"
}

# graph, paritions
suite () {	
    #    PR "$1" $2 0 false EdgePartition2D $3 0 0.00001
    #    PR "$1" $2 100 false HybridCut $3 0 0.00001
    PR "$1" $2 0 false EdgePartition2D $3 0 0.01 "$4"
    PR "$1" $2 100 false HybridCut $3 0 0.01 "$4"
    #   foo $1 $2 100 false HybridCutPlus $3 0 0.01
    #   foo $1 $2 0 false EdgePartition1DDst $3 0 0.01
    #   foo $1 $2 0 false RandomVertexCut $3 0 0.01
    #   foo $1 $2 0 false CanonicalRandomVertexCut $3 0 0.01
}

suiteiter () {	
    #   PR "$1" $2 0 false EdgePartition2D $3 $4 0.01
    PR "$1" $2 100 false HybridCut $3 $4 0.01
    #   foo $1 $2 100 false HybridCutPlus $3 $4 0.01
    #   foo $1 $2 0 false EdgePartition2D $3 $4 0.01
    #   foo $1 $2 0 false EdgePartition1DDst $3 $4 0.01
    #   foo $1 $2 0 false RandomVertexCut $3 $4 0.01
    #   foo $1 $2 0 false CanonicalRandomVertexCut $3 $4 0.01
}

fullsuite () {	
    foo $1 $2 100 false HybridCut $3 0 0.01
    # foo $1 $2 30 false HybridCut $3 0 0.01
    foo $1 $2 100 false HybridCutPlus $3 0 0.01
    foo $1 $2 0 false EdgePartition2D $3 0 0.01
    #foo $1 $2 0 false EdgePartition2DV1 $3 0 0.01
    #foo $1 $2 0 false CanonicalEdgePartition2DV1 $3 0 0.01
    #foo $1 $2 0 false CanonicalEdgePartition2DV2 $3 0 0.01
    foo $1 $2 0 false EdgePartition1DDst $3 0 0.01
    foo $1 $2 0 false RandomVertexCut $3 0 0.01
    foo $1 $2 0 false CanonicalRandomVertexCut $3 0 0.01
}

# foo in-1.8-10m 16 100 false HybridCut true 0 0.01
# foo in-1.8-10m 16 0 false EdgePartition2D true 0 0.01

#foo in-2.0-1m 16 30 false HybridCut true 0 0.01
#foo in-2.0-1m 25 30 false HybridCut true 0 0.01
#foo in-2.0-1m 48 30 false HybridCut true 0 0.01

#foo in-2.0-1m 16 100 false HybridCut false 0 0.01
#foo in-2.0-1m 16 30 false HybridCut false 0 0.01
#foo in-2.0-1m 16 0 false EdgePartition2D false 0 0.01
#foo in-2.0-1m 16 0 false EdgePartition1DDst false 0 0.01
#foo in-2.0-1m 16 0 false RandomVertexCut false 0 0.01
#foo in-2.0-1m 16 0 false CanonicalRandomVertexCut false 0 0.01
#
#foo in-2.0-1m 25 100 false HybridCut false 0 0.01
#foo in-2.0-1m 25 30 false HybridCut false 0 0.01
#foo in-2.0-1m 25 0 false EdgePartition2D false 0 0.01
#foo in-2.0-1m 25 0 false EdgePartition1DDst false 0 0.01
#foo in-2.0-1m 25 0 false RandomVertexCut false 0 0.01
#foo in-2.0-1m 25 0 false CanonicalRandomVertexCut false 0 0.01
#
#foo in-2.0-1m 48 100 false HybridCut false 0 0.01
#foo in-2.0-1m 48 30 false HybridCut false 0 0.01
#foo in-2.0-1m 48 0 false EdgePartition2D false 0 0.01
#foo in-2.0-1m 48 0 false EdgePartition1DDst false 0 0.01
#foo in-2.0-1m 48 0 false RandomVertexCut false 0 0.01
#foo in-2.0-1m 48 0 false CanonicalRandomVertexCut false 0 0.01

#foo in-2.0-1m 16 100 false HybridCut ture 0 0.01
#foo in-2.0-1m 16 0 false EdgePartition2D true 0 0.01
#foo in-2.0-1m 16 0 false EdgePartition1DDst true 0 0.01
#foo in-2.0-1m 16 0 false RandomVertexCut true 0 0.01
#foo in-2.0-1m 16 0 false CanonicalRandomVertexCut true 0 0.01
#
#foo in-2.0-1m 25 100 false HybridCut true 0 0.01
#foo in-2.0-1m 25 0 false EdgePartition2D true 0 0.01
#foo in-2.0-1m 25 0 false EdgePartition1DDst true 0 0.01
#foo in-2.0-1m 25 0 false RandomVertexCut true 0 0.01
#foo in-2.0-1m 25 0 false CanonicalRandomVertexCut true 0 0.01
#
#foo in-2.0-1m 48 100 false HybridCut true 0 0.01
#foo in-2.0-1m 48 0 false EdgePartition2D true 0 0.01
#foo in-2.0-1m 48 0 false EdgePartition1DDst true 0 0.01
#foo in-2.0-1m 48 0 false RandomVertexCut true 0 0.01
#foo in-2.0-1m 48 0 false CanonicalRandomVertexCut true 0 0.01

#foo web-google-single 16 100 false HybridCut false 0 0.01
#foo web-google-single 16 30 false HybridCut false 0 0.01
#foo web-google-single 16 0 false EdgePartition2D false 0 0.01
#foo web-google-single 16 0 false EdgePartition1DDst false 0 0.01
#foo web-google-single 16 0 false RandomVertexCut false 0 0.01
#foo web-google-single 16 0 false CanonicalRandomVertexCut false 0 0.01
#
#foo web-google-single 25 100 false HybridCut false 0 0.01
#foo web-google-single 25 30 false HybridCut false 0 0.01
#foo web-google-single 25 0 false EdgePartition2D false 0 0.01
#foo web-google-single 25 0 false EdgePartition1DDst false 0 0.01
#foo web-google-single 25 0 false RandomVertexCut false 0 0.01
#foo web-google-single 25 0 false CanonicalRandomVertexCut false 0 0.01
#
#foo web-google-single 48 100 false HybridCut false 0 0.01
#foo web-google-single 48 30 false HybridCut false 0 0.01
#foo web-google-single 48 0 false EdgePartition2D false 0 0.01
#foo web-google-single 48 0 false EdgePartition1DDst false 0 0.01
#foo web-google-single 48 0 false RandomVertexCut false 0 0.01
#foo web-google-single 48 0 false CanonicalRandomVertexCut false 0 0.01
#
#foo soc-LiveJournal1.txt 16 100 false HybridCut false 0 0.01
#foo soc-LiveJournal1.txt 16 30 false HybridCut false 0 0.01
#foo soc-LiveJournal1.txt 16 0 false EdgePartition2D false 0 0.01
#foo soc-LiveJournal1.txt 16 0 false EdgePartition1DDst false 0 0.01
#foo soc-LiveJournal1.txt 16 0 false RandomVertexCut false 0 0.01
#foo soc-LiveJournal1.txt 16 0 false CanonicalRandomVertexCut false 0 0.01
#
#foo soc-LiveJournal1.txt 25 100 false HybridCut false 0 0.01
#foo soc-LiveJournal1.txt 25 30 false HybridCut false 0 0.01
#foo soc-LiveJournal1.txt 25 0 false EdgePartition2D false 0 0.01
#foo soc-LiveJournal1.txt 25 0 false EdgePartition1DDst false 0 0.01
#foo soc-LiveJournal1.txt 25 0 false RandomVertexCut false 0 0.01
#foo soc-LiveJournal1.txt 25 0 false CanonicalRandomVertexCut false 0 0.01
#
#foo soc-LiveJournal1.txt 48 100 false HybridCut false 0 0.01
#foo soc-LiveJournal1.txt 48 30 false HybridCut false 0 0.01
#foo soc-LiveJournal1.txt 48 0 false EdgePartition2D false 0 0.01
#foo soc-LiveJournal1.txt 48 0 false EdgePartition1DDst false 0 0.01
#foo soc-LiveJournal1.txt 48 0 false RandomVertexCut false 0 0.01
#foo soc-LiveJournal1.txt 48 0 false CanonicalRandomVertexCut false 0 0.01

# Wed Sep  3 16:03:49 CST 2014
#foo soc-LiveJournal1.txt 16 30 false HybridCutPlus false 0 0.01
#foo soc-LiveJournal1.txt 25 30 false HybridCutPlus false 0 0.01
#foo soc-LiveJournal1.txt 48 30 false HybridCutPlus false 0 0.01

#Fri Sep  5 10:42:30 CST 2014
#foo in-2.0-1m 16 0 false EdgePartition2DV1 false 0 0.01
#foo in-2.0-1m 16 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo in-2.0-1m 16 0 false CanonicalEdgePartition2DV2 false 0 0.01
#foo in-2.0-1m 25 0 false EdgePartition2DV1 false 0 0.01
#foo in-2.0-1m 25 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo in-2.0-1m 25 0 false CanonicalEdgePartition2DV2 false 0 0.01
#foo in-2.0-1m 48 0 false EdgePartition2DV1 false 0 0.01
#foo in-2.0-1m 48 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo in-2.0-1m 48 0 false CanonicalEdgePartition2DV2 false 0 0.01
#foo in-2.0-1m 49 0 false EdgePartition2DV1 false 0 0.01
#foo in-2.0-1m 49 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo in-2.0-1m 49 0 false CanonicalEdgePartition2DV2 false 0 0.01
#
#foo web-google-single 16 0 false EdgePartition2DV1 false 0 0.01
#foo web-google-single 16 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo web-google-single 16 0 false CanonicalEdgePartition2DV2 false 0 0.01
#foo web-google-single 25 0 false EdgePartition2DV1 false 0 0.01
#foo web-google-single 25 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo web-google-single 25 0 false CanonicalEdgePartition2DV2 false 0 0.01
#foo web-google-single 48 0 false EdgePartition2DV1 false 0 0.01
#foo web-google-single 48 0 false CanonicalEdgePartition2DV1 false 0 0.01

#foo web-google-single 48 0 false CanonicalEdgePartition2DV2 false 0 0.01
#foo web-google-single 49 0 false EdgePartition2DV1 false 0 0.01
#foo web-google-single 49 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo web-google-single 49 0 false CanonicalEdgePartition2DV2 false 0 0.01
#
#foo soc-LiveJournal1.txt 16 0 false EdgePartition2DV1 false 0 0.01
#foo soc-LiveJournal1.txt 16 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo soc-LiveJournal1.txt 16 0 false CanonicalEdgePartition2DV2 false 0 0.01
#foo soc-LiveJournal1.txt 25 0 false EdgePartition2DV1 false 0 0.01
#foo soc-LiveJournal1.txt 25 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo soc-LiveJournal1.txt 25 0 false CanonicalEdgePartition2DV2 false 0 0.01
#foo soc-LiveJournal1.txt 48 0 false EdgePartition2DV1 false 0 0.01
#foo soc-LiveJournal1.txt 48 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo soc-LiveJournal1.txt 48 0 false CanonicalEdgePartition2DV2 false 0 0.01
#foo soc-LiveJournal1.txt 49 0 false EdgePartition2DV1 false 0 0.01
#foo soc-LiveJournal1.txt 49 0 false CanonicalEdgePartition2DV1 false 0 0.01
#foo soc-LiveJournal1.txt 49 0 false CanonicalEdgePartition2DV2 false 0 0.01
#
#foo in-2.0-1m 49 100 false HybridCut true 0 0.01
#foo in-2.0-1m 49 30 false HybridCut true 0 0.01
#foo in-2.0-1m 49 0 false EdgePartition2D true 0 0.01
#foo in-2.0-1m 49 0 false EdgePartition1DDst true 0 0.01
#foo in-2.0-1m 49 0 false RandomVertexCut true 0 0.01
#foo in-2.0-1m 49 0 false CanonicalRandomVertexCut true 0 0.01
#
#foo web-google-single 49 100 false HybridCut false 0 0.01
#foo web-google-single 49 30 false HybridCut false 0 0.01
#foo web-google-single 49 0 false EdgePartition2D false 0 0.01
#foo web-google-single 49 0 false EdgePartition1DDst false 0 0.01
#foo web-google-single 49 0 false RandomVertexCut false 0 0.01
#foo web-google-single 49 0 false CanonicalRandomVertexCut false 0 0.01
#
#foo soc-LiveJournal1.txt 49 100 false HybridCut false 0 0.01
#foo soc-LiveJournal1.txt 49 30 false HybridCut false 0 0.01
#foo soc-LiveJournal1.txt 49 0 false EdgePartition2D false 0 0.01
#foo soc-LiveJournal1.txt 49 0 false EdgePartition1DDst false 0 0.01
#foo soc-LiveJournal1.txt 49 0 false RandomVertexCut false 0 0.01
#foo soc-LiveJournal1.txt 49 0 false CanonicalRandomVertexCut false 0 0.01

#Tue Sep  9 11:26:45 CST 2014
# suite wiki 16
#foo 2005uk 24 0 false HybridCut false 0 0.01
#foo 2005uk 36 0 false HybridCut false 0 0.01
# suite 2005uk 36
# suite twitter 36

# Wed Sep 10 10:30:11 CST 2014
#suite wiki 36
#suite 2005uk 48
#suite twitter 48
#suite in-2.0-1m 36 true

#foo web-google-single 16 30 false HybridCutPlus false 0 0.01
#foo web-google-single 25 30 false HybridCutPlus false 0 0.01
#foo web-google-single 48 30 false HybridCutPlus false 0 0.01
#foo web-google-single 16 100 false HybridCutPlus false 0 0.01
#foo web-google-single 25 100 false HybridCutPlus false 0 0.01
#foo web-google-single 48 100 false HybridCutPlus false 0 0.01
#foo in-2.0-1m 16 30 false HybridCutPlus false 0 0.01
#foo in-2.0-1m 25 30 false HybridCutPlus false 0 0.01
#foo in-2.0-1m 48 30 false HybridCutPlus false 0 0.01
#foo in-2.0-1m 16 100 false HybridCutPlus false 0 0.01
#foo in-2.0-1m 25 100 false HybridCutPlus false 0 0.01
#foo in-2.0-1m 48 100 false HybridCutPlus false 0 0.01
#foo 2005uk 36 100 false HybridCutPlus false 0 0.01
#foo twitter 36 100 false HybridCutPlus false 0 0.01
#foo wiki 36 100 false HybridCutPlus false 0 0.01

# Fri Sep 12 08:48:12 CST 2014
#suite in-1.8-10m 36 false

#Fri Sep 12 11:37:25 CST 2014
#foo netflix1 36 0 false BiSrcCut false 0 0.01
#foo netflix1 36 0 false BiDstCut false 0 0.01
#suite netflix1 36 false

#Mon Sep 15 10:26:28 CST 2014
#suite wiki 36 true
#suite 2005uk 36 true
#suite twitter 36 true

#Thu Sep 18 16:53:04 CST 2014
#suite in-1.8-10m 36 true

#Mon Sep 22 10:46:19 CST 2014
#suite in-1.8-10m 36 true

#Mon Sep 22 18:26:10 CST 2014
#suite10 in-2.0-10m 36 true
#suite10 web-google-single 36 true

#Tue Sep 23 10:19:25 CST 2014
#suite10 in-2.0-10m 72 true
#suiteiter in-2.0-10m 36 true 50

#Tue Sep 23 14:48:56 CST 2014
#ccsuite in-2.0-10m 36

#Tue Sep 23 19:43:51 CST 2014
#suiteiter in-2.0-10m 144 true 10
#suiteiter in-2.0-10m 144 true 50

#Wed Sep 24 09:55:18 CST 2014

#ccsuite in-2.0-10m 36
#ccsuite in-2.0-10m 36

#Wed Sep 24 15:25:10 CST 2014
#suiteiter in-2.0-10m 36 true 10

#Wed Sep 24 22:18:20 CST 2014
#ccsuite in-2.0-10m 36

#Thu Sep 25 09:43:08 CST 2014
#suiteiter in-2.0-10m 36 true 10
#foolocal in-2.0-10m 36 100 false HybridCut true 10 0.01
#foolocal in-2.0-10m 36 100 false EdgePartition2D true 10 0.01
#foolocal in-2.0-10m 36 100 false RandomVertexCut true 10 0.01

#Thu Sep 25 10:25:02 CST 2014 add lookup table to original partition methods, to include same overhead
# Lookuptable changed the partition.. investigating
# possible: http://apache-spark-user-list.1001560.n3.nabble.com/preservesPartitioning-td10019.html
#suiteiter in-2.0-10m 36 true 10
#ccsuite in-2.0-10m 36

#Thu Sep 25 19:54:10 CST 2014 examine pregel (converge PR), and new API (iter PR)
#suite in-2.0-10m 36 true

#Fri Sep 26 09:41:03 CST 2014 test vertex partition
#suiteiter in-2.0-10m 36 true 10
#suiteiter in-2.0-10m 36 true 10
#suiteiter in-2.0-10m 36 true 10
#suiteiter in-2.0-10m 36 true 10

#Fri Sep 26 16:18:12 CST 2014
#suite in-2.0-10m 36 true

#ccsuite in-2.0-10m 48
#suiteiter in-2.0-10m 48 true 10

#Sat Sep 27 14:09:02 CST 2014 try twitter
#suiteiter twitter 36 false 10
#foolocal in-2.0-10m 36 100 false RandomVertexCut true 10 0.01
#cc in-2.0-10m 36 RandomVertexCut 
#foolocal in-2.0-10m 48 100 false EdgePartition2D true 0 0.01
#foolocal in-2.0-10m 48 100 false HybridCut true 0 0.01

#cclocal in-2.0-10m 48 EdgePartition2D
#cclocal in-2.0-10m 48 HybridCut
#cclocal in-2.0-10m 48 EdgePartition2D
#cclocal in-2.0-10m 48 HybridCut

#"/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" HybridCut --numEPart=48 --threshHold=100 --reverse=false \
    #2>&1 | tee $(date +"%Y%m%d-%H%M")_HybridCut_48.txt;
#export MASTER=spark://brick6:7077
#./bin/run-example benchmark.GraphXPartition \
    #    "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" EdgePartition2D --numEPart=48 --threshHold=100 --reverse=false \
    #    --run=true --numIter=10 --tol=0.01 \
    #    2>&1 | tee $(date +"%Y%m%d-%H%M")_Edge2D_48.txt;
#suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 4 true
#suite "/data/sdc1/xiaodi/data/web-google-single" 24 true
#suite "/data/sdc1/xiaodi/data/web-google-single" 4 true "web-google-single"
#suiteiter "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 24 true 10
#suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 24 true "in-2.0-10m(GC_Parallel_NewRatio=1)"
#ccsuite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 60 "in-2.0-10m(GC_Parallel_NewRatio=1)"
#ccsuite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 60 "in-2.0-10m(GC_Parallel_NewRatio=1)"
#ccsuite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 60 "in-2.0-10m(GC_Parallel_NewRatio=1)"

#suite "/data/sdc1/xiaodi/data/twitter_split/*" 6 true "test_twitter"
#suite "hdfs://sjx-ipads:54310/dataset/twitter" 6 true "test_twitter"

#ccsuite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 36 "in-2.0-10m(original)"
#suite "/data/sdc1/xiaodi/data/twitter_split/*" 36 true "twitter_with_45G"
#suite "hdfs://sjx-ipads:54310/dataset/twitter" 36 true "twitter_with_45G"
#suite "/data/sdc1/xiaodi/data/twitter_split/*" 36 true "twitter_with_55G"
#suite "/data/sdc1/xiaodi/data/twitter_split/*" 36 true "twitter_with_55G_UseConcMarkSweepGC"
#suite "/data/sdc1/xiaodi/data/twitter_split/*" 36 true "twitter_with_JVM60G_Executor50G_UseParallelGC_debug"
#GC log show no significant GC time
#step: 14/09/30 14:46:29 INFO BlockManagerInfo: Added broadcast_0_piece0 in memory on brick6.ipads-lab.se.s
#146 14/09/30 14:44:31 WARN TaskSetManager: Lost task 20.0 in stage 0.0 (TID 20, brick4.ipads-lab.se.sjtu.edu.cn): java.lang.OutOfMemoryError: GC overhead limit exceeded
#147         java.util.Arrays.copyOf(Arrays.java:2219)
#148         java.util.ArrayList.grow(ArrayList.java:242)
#149         java.util.ArrayList.ensureExplicitCapacity(ArrayList.java:216)
#150         java.util.ArrayList.ensureCapacityInternal(ArrayList.java:208)
#151         java.util.ArrayList.add(ArrayList.java:440)
#152         java.util.regex.Pattern.split(Pattern.java:1203)
#153         java.lang.String.split(String.java:2313)
#154         java.lang.String.split(String.java:2355)
#155         org.apache.spark.graphx.GraphLoader$$anonfun$1$$anonfun$apply$1.apply(GraphLoader.scala:72)
#156         org.apache.spark.graphx.GraphLoader$$anonfun$1$$anonfun$apply$1.apply(GraphLoader.scala:70)
#157         scala.collection.Iterator$class.foreach(Iterator.scala:727)
#158         scala.collection.AbstractIterator.foreach(Iterator.scala:1157)
#159         org.apache.spark.graphx.GraphLoader$$anonfun$1.apply(GraphLoader.scala:70)
#160         org.apache.spark.graphx.GraphLoader$$anonfun$1.apply(GraphLoader.scala:68)
#161         org.apache.spark.rdd.RDD$$anonfun$14.apply(RDD.scala:609)
#162         org.apache.spark.rdd.RDD$$anonfun$14.apply(RDD.scala:609)
#163         org.apache.spark.rdd.MapPartitionsRDD.compute(MapPartitionsRDD.scala:35)
#164         org.apache.spark.rdd.RDD.computeOrReadCheckpoint(RDD.scala:262)
#165         org.apache.spark.CacheManager.getOrCompute(CacheManager.scala:61)
#166         org.apache.spark.rdd.RDD.iterator(RDD.scala:227)
#167         org.apache.spark.scheduler.ResultTask.runTask(ResultTask.scala:62)
#168         org.apache.spark.scheduler.Task.run(Task.scala:54)
#suite "/data/sdc1/xiaodi/data/twitter_split/*" 6 true "6x1_twitter_with_JVM60G_Executor50G_UseParallelGC_DAEMONMEMORY50G_SPARKJAVAOPTS_debug"
# SPARK_DAEMON_JAVA_OPTS is not working as expected. so use SPARK_JAVA_OPTS to set JAVA_OPTS

#suite "/data/sdc1/xiaodi/data/twitter_split/*" 6 true "6x1_twitter_with_JVM60G_Executor50G_UseParallelGC_DAEMONMEMORY50G_RAIO1_debug"
# can finish loading graph, but fails when finishing last half of partitioning stage
#14/09/30 16:08:44 INFO BlockManagerInfo: Removed broadcast_3_piece0 on brick3.ipads-lab.se.sjtu.edu.cn:38117 in memory (size: 2.5 KB, free: 19.9 GB)
#14/09/30 16:09:08 INFO BlockManagerInfo: Removed broadcast_3_piece0 on brick2.ipads-lab.se.sjtu.edu.cn:60418 in memory (size: 2.5 KB, free: 20.0 GB)
#14/09/30 16:09:14 ERROR ContextCleaner: Error cleaning broadcast 3
#java.util.concurrent.TimeoutException: Futures timed out after [30 seconds]
#at scala.concurrent.impl.Promise$DefaultPromise.ready(Promise.scala:219)
#at scala.concurrent.impl.Promise$DefaultPromise.result(Promise.scala:223)
#at scala.concurrent.Await$$anonfun$result$1.apply(package.scala:107)
#at scala.concurrent.BlockContext$DefaultBlockContext$.blockOn(BlockContext.scala:53)
#at scala.concurrent.Await$.result(package.scala:107)
#at org.apache.spark.storage.BlockManagerMaster.removeBroadcast(BlockManagerMaster.scala:138)
#at org.apache.spark.broadcast.TorrentBroadcast$.unpersist(TorrentBroadcast.scala:230)
#at org.apache.spark.broadcast.TorrentBroadcastFactory.unbroadcast(TorrentBroadcastFactory.scala:46)
#at org.apache.spark.broadcast.BroadcastManager.unbroadcast(BroadcastManager.scala:66)
#at org.apache.spark.ContextCleaner.doCleanupBroadcast(ContextCleaner.scala:185)
#at org.apache.spark.ContextCleaner$$anonfun$org$apache$spark$ContextCleaner$$keepCleaning$1$$anonfun$apply$mcV$sp$2.apply(ContextCleaner.scala:147)
#at org.apache.spark.ContextCleaner$$anonfun$org$apache$spark$ContextCleaner$$keepCleaning$1$$anonfun$apply$mcV$sp$2.apply(ContextCleaner.scala:138)
#at scala.Option.foreach(Option.scala:236)
#at org.apache.spark.ContextCleaner$$anonfun$org$apache$spark$ContextCleaner$$keepCleaning$1.apply$mcV$sp(ContextCleaner.scala:138)
#at org.apache.spark.ContextCleaner$$anonfun$org$apache$spark$ContextCleaner$$keepCleaning$1.apply(ContextCleaner.scala:134)
#at org.apache.spark.ContextCleaner$$anonfun$org$apache$spark$ContextCleaner$$keepCleaning$1.apply(ContextCleaner.scala:134)
#at org.apache.spark.util.Utils$.logUncaughtExceptions(Utils.scala:1284)
#at org.apache.spark.ContextCleaner.org$apache$spark$ContextCleaner$$keepCleaning(ContextCleaner.scala:133)
#at org.apache.spark.ContextCleaner$$anon$3.run(ContextCleaner.scala:65)
#14/09/30 16:09:14 INFO BlockManager: Removing broadcast 2

#suite "/data/sdc1/xiaodi/data/twitter_split/*" 5 true "5x1_twitter_with_JVM60G_Executor50G_UseParallelGC_DAEMONMEMORY50G_RAIO1_CpTASK24_debug"
# too slow, though not much IO

#suite "hdfs://sjx-ipads:54310/dataset/twitter" 5 true "5x1_twitter_with_JVM60G_Executor50G_UseParallelGC_DAEMONMEMORY50G_RAIO1_CpTASK24_HDFS_debug"
# many GC loading still

# use local copy of data file
#suite "/data/sdb1/xiaodi/twitter" 5 true "5x1_twitter_with_JVM60G_Executor50G_UseParallelGC_DAEMONMEMORY50G_RATIO1_CpTASK24_localcopy_debug"
#suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 72 true "shuffle_stat"
#suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 72 true "shuffle_stat"
#suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 24 false "shuffle_stat_Z"
#suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 24 true "shuffle_stat_Z"
#suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 36 false "shuffle_stat_Z"
#ccsuite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 36 "shuffle_stat-Z"
#suite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 60 false "shuffle_stat-Z"
#ccsuite "/data/sdc1/xiaodi/data/in-2.0-10m-split/in-2.0-10m*" 60 "shuffle_stat-Z"
# use local copy of data file
# loading file improves 7.6min
# edge2d finish in 26 min
# hybird finish in 56 min
# suite "/data/sdb1/xiaodi/twitter" 36 false "twitter_partition"
# run
#suite "/data/sdb1/xiaodi/twitter" 36 true "twitter_run"

#spark.core.connection.ack.wait.timeout 60 -> 120
#suite "/data/sdb1/xiaodi/twitter" 36 true "twitter_run_ack_timeout120"

# Successfully run twitter PR, now proceed to CC. GG
ccsuite "/data/sdb1/xiaodi/twitter" 36 true "twitter_run_ack_timeout120"

notify GraphX_OK_$(date +"%Y%m%d-%H%M") &
