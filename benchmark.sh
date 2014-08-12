#!/bin/sh
# @Author: Larry Xiao
# @Date:   Tue Aug  5 15:17:48 CST 2014
# @Last Modified by:   Larry Xiao

# for j in in-2.0-1m in-1.8-10m soc-LiveJournal1.txt web-google-single twitter
# for i in HybridCut EdgePartition2D EdgePartition1D RandomVertexCut CanonicalRandomVertexCut;
# for i in HybridCut; 
# do
	echo $5\_$1\_$2\_$3\_$4;
	# echo /data/sdd1/xiaodi/data/$i\_$1\_$2;
	MASTER=spark://brick0:7077 ./bin/run-example benchmark.GraphXPartition /data/sdd1/xiaodi/data/$1 $5 --numEPart=$2 --threshHold=$3 --reverse=$4 2>&1 | tee $(date +"%Y%m%d-%H%M")_$5\_$1\_$2\_$3\_$4.txt;
# done
