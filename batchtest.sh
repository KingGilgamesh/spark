#!/bin/sh
# @Author: Larry Xiao
# @Date:   2014-07-25 10:41:14
# @Last Modified by:   Larry Xiao
# @Last Modified time: 2014-07-29 16:36:42

# for i in HybridCut EdgePartition2D EdgePartition1D RandomVertexCut CanonicalRandomVertexCut BiSrcCut BiDstCut;
# for i in HybridCut EdgePartition2D EdgePartition1D RandomVertexCut CanonicalRandomVertexCut;
for i in EdgePartition2D EdgePartition1D RandomVertexCut CanonicalRandomVertexCut;
do
	echo $i;
# 60 parts not  working
#	./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar /data/sdd1/xiaodi/data/web-google-single --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=60 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;
# web-google-single 6
#	./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar /data/sdd1/xiaodi/data/web-google-single --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=6 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;
# general 
#	./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar graphx/data/soc-LiveJournal1.txt --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=6 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;
# netflix_1/netflix.matrix
#	./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar /data/sdd1/xiaodi/data/netflix_1/netflix.matrix --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=6 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;


# Mon Jul 28 17:13:21 CST 2014
	# ./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar /data/sdd1/xiaodi/data/web-google-single --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=4 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;

# Tue Jul 29 16:35:32 2014
	# ./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar /data/sdd1/xiaodi/data/in-2.0-1m_aa --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=4 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;


#Tue Jul 29 16:45:02 CST 2014
#	./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar /data/sdd1/xiaodi/data/in-1.8-10m_aa --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=4 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;

#Wed Jul 30 10:35:11 CST 2014
# ./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar /data/sdd1/xiaodi/data/in-2.0-1m --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=4 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;

# Wed Jul 30 11:39:40 CST 2014
# ./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar /data/sdd1/xiaodi/data/in-1.8-10m --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=4 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;

# Fri Aug  1 11:03:37 CST 2014
#	./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar /data/sdd1/xiaodi/data/in-1.8-10m --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=144 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;

	./bin/spark-submit --total-executor-cores=24 --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar /data/sdd1/xiaodi/data/in-1.8-10m --tol=0.01 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=24 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt;
done
