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

		# hdfs
foo () {
	echo $5\_$1\_$2\_$3\_$4;
	export MASTER=spark://brick0:7077
	./bin/run-example benchmark.GraphXPartition \
		hdfs://sjx-ipads:54310/dataset/$1 $5 --numEPart=$2 --threshHold=$3 --reverse=$4 \
		--run=$6 --numIter=$7 --tol=$8 \
		2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$1\_$2\_$3\_$4.txt;
}

cc () {
    export MASTER=spark://brick0:7077
    ./bin/run-example graphx.Analytics cc hdfs://sjx-ipads:54310/dataset/$1 \
        --numEPart=$2 --partStrategy=$3 \
		2>&1 | tee $(date +"%Y%m%d-%H%M")_CC\_$1\_$2\_$3.txt;
}

ccsuite () {
   cc $1 $2 HybridCut 
#   cc $1 $2 HybridCutPlus
   cc $1 $2 EdgePartition2D 
#   cc $1 $2 EdgePartition1DDst 
#   cc $1 $2 RandomVertexCut 
#   cc $1 $2 CanonicalRandomVertexCut 
}

# graph, paritions
suite () {	
    foo $1 $2 0 false EdgePartition2D $3 0 0.01
    foo $1 $2 100 false HybridCut $3 0 0.01
#   foo $1 $2 100 false HybridCutPlus $3 0 0.01
#   foo $1 $2 0 false EdgePartition2D $3 0 0.01
#   foo $1 $2 0 false EdgePartition1DDst $3 0 0.01
#   foo $1 $2 0 false RandomVertexCut $3 0 0.01
#   foo $1 $2 0 false CanonicalRandomVertexCut $3 0 0.01
}

suiteiter () {	
    foo $1 $2 0 false EdgePartition2D $3 $4 0.01
    foo $1 $2 100 false HybridCut $3 $4 0.01
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

ccsuite in-2.0-10m 36
#Fri Sep 26 16:18:12 CST 2014
#suite in-2.0-10m 36 true

notify GraphX_OK_$(date +"%Y%m%d-%H%M") &
