#!/bin/bash


		# local fs
		#/data/sdc1/xiaodi/data/$1 $5 --numEPart=$2 --threshHold=$3 --reverse=$4 \
		# hdfs
foo () {
	echo $5\_$1\_$2\_$3\_$4;
	export MASTER=spark://brick0:7077
	./bin/run-example benchmark.GraphXPartition \
		hdfs://sjx-ipads:54310/dataset/$1 $5 --numEPart=$2 --threshHold=$3 --reverse=$4 \
		--run=$6 --numIter=$7 --tol=$8 \
		2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$1\_$2\_$3\_$4.txt;
}

# graph, paritions
suite () {	
	foo $1 $2 100 false HybridCut $3 0 0.01
	foo $1 $2 100 false HybridCutPlus $3 0 0.01
	foo $1 $2 0 false EdgePartition2D $3 0 0.01
	foo $1 $2 0 false EdgePartition1DDst $3 0 0.01
	foo $1 $2 0 false RandomVertexCut $3 0 0.01
	foo $1 $2 0 false CanonicalRandomVertexCut $3 0 0.01
}

suite10 () {	
	foo $1 $2 100 false HybridCut $3 11 0.01
	foo $1 $2 100 false HybridCutPlus $3 11 0.01
	foo $1 $2 0 false EdgePartition2D $3 11 0.01
	foo $1 $2 0 false EdgePartition1DDst $3 11 0.01
	foo $1 $2 0 false RandomVertexCut $3 11 0.01
	foo $1 $2 0 false CanonicalRandomVertexCut $3 11 0.01
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

notify (){
	# send notification
	notify_irc.expect GrpahX_OK_$(date +"%Y%m%d-%H%M") &
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
suite10 in-2.0-10m 72 true
notify
