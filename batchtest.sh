#!/bin/sh
# @Author: Larry Xiao
# @Date:   2014-07-25 10:41:14
# @Last Modified by:   Larry Xiao
# @Last Modified time: 2014-07-25 10:42:47

for i in HybridCut EdgePartition2D EdgePartition1D RandomVertexCut CanonicalRandomVertexCut;
do
	./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar graphx/data/soc-LiveJournal1.txt --tol=0.1 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=6 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;
	echo $i;
done
