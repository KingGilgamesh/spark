#!/bin/bash


foo () {
	echo $5\_$1\_$2\_$3\_$4;
	MASTER=spark://brick0:7077
	./bin/run-example benchmark.GraphXPartition \
		/data/sdd1/xiaodi/data/$1 $5 --numEPart=$2 --threshHold=$3 --reverse=$4 \
		--run=$6 --numIter=$7 --tol=$8 \
		2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$1\_$2\_$3\_$4.txt;
}

notify (){
	# send notification
	notify_irc.expect GrpahX_OK_$(date +"%Y%m%d-%H%M") &
}

foo in-2.0-1m 16 100 false HybridCut true 0 0.01
foo in-2.0-1m 16 0 false EdgePartition2D true 0 0.01
foo in-2.0-1m 16 0 false EdgePartition1DDst true 0 0.01
foo in-2.0-1m 16 0 false RandomVertexCut true 0 0.01
foo in-2.0-1m 16 0 false CanonicalRandomVertexCut true 0 0.01

foo in-2.0-1m 25 100 false HybridCut true 0 0.01
foo in-2.0-1m 25 0 false EdgePartition2D true 0 0.01
foo in-2.0-1m 25 0 false EdgePartition1DDst true 0 0.01
foo in-2.0-1m 25 0 false RandomVertexCut true 0 0.01
foo in-2.0-1m 25 0 false CanonicalRandomVertexCut true 0 0.01

foo in-2.0-1m 48 100 false HybridCut true 0 0.01
foo in-2.0-1m 48 0 false EdgePartition2D true 0 0.01
foo in-2.0-1m 48 0 false EdgePartition1DDst true 0 0.01
foo in-2.0-1m 48 0 false RandomVertexCut true 0 0.01
foo in-2.0-1m 48 0 false CanonicalRandomVertexCut true 0 0.01

notify
