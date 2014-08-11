
Tue Aug  5 15:40:38 CST 2014 partition benchmark suite
. benchmark.sh <file> <numParts>

Tue Aug  5 10:40:51 CST 2014 graph property
indegree
  println(GraphLoader.edgeListFile(sc, "/data/sdd1/xiaodi/data/in-2.0-1m").inDegrees.map(e => (e._2, 1)).reduceByKey((a, b) => a + b).collect().sortWith(_._1 > _._1).mkString(" "))
outdegree
  println(GraphLoader.edgeListFile(sc, "/data/sdd1/xiaodi/data/in-2.0-1m").reverse.inDegrees.map(e => (e._2, 1)).reduceByKey((a, b) => a + b).collect().sortWith(_._1 > _._1).mkString(" "))

Mon Aug  4 19:17:07 CST 2014 update GraphX
https://github.com/apache/spark/commit/6c2be93f081f33e9e97e1231b0084a6a0eb4fa22
Remove GraphX MessageToPartition for compatibility with sort-based sh…
…uffle

MessageToPartition was used in `Graph#partitionBy`. Unlike a Tuple2, it marked the key as transient to avoid sending it over the network. However, it was incompatible with sort-based shuffle (SPARK-2045) and represented only a minor optimization: for partitionBy, it improved performance by 6.3% (30.4 s to 28.5 s) and reduced communication by 5.6% (114.2 MB to 107.8 MB).

Author: Ankur Dave <ankurdave@gmail.com>

Closes #1537 from ankurdave/remove-MessageToPartition and squashes the following commits:

f9d0054 [Ankur Dave] Remove MessageToPartition
ab71364 [Ankur Dave] Remove unused VertexBroadcastMsg

Wed Jul 30 10:35:38 2014 graph property

learn about the in-degrees distribution in a graph
	dist = graph.inDegrees.map(e => (e._2, 1)).reduceByKey((a, b) => a + b).collect()
	dist.sortWith(_._1 > _._1)
	println(dist.sortWith(_._1 > _._1).mkString(" "))
=>	println(GraphLoader.edgeListFile(sc, "graphx/data/followers.txt", false, 4).inDegrees.map(e => (e._2, 1)).reduceByKey((a, b) => a + b).collect().sortWith(_._1 > _._1).mkString(" "))

P.S. all data are moved to the data folder now

Tue Jul 29 11:47:43 2014 GraphLoader parameter
val graph = GraphLoader.edgeListFile(sc, "graphx/data/followers.txt", false, 4)
* @param sc SparkContext
* @param path the path to the file (e.g., /home/data/file or hdfs://file)
* @param canonicalOrientation whether to orient edges in the positive direction
* @param minEdgePartitions the number of partitions for the edge RDD
* @param edgeStorageLevel the desired storage level for the edge partitions
* @param vertexStorageLevel the desired storage level for the vertex partitions


Mon Jul 28 19:48:16 2014 lone master test
	
	show vertices
		graph.vertices.collect()
		Array[(org.apache.spark.graphx.VertexId, Int)] = Array((4,1), (1,1), (6,1), (3,1), (7,1), (2,1))
	show edges
		graph.edges.collect()
		Array[org.apache.spark.graphx.Edge[Int]] = Array(Edge(1,2,1), Edge(2,1,1), Edge(3,7,1), Edge(4,1,1), Edge(6,3,1), Edge(6,7,1), Edge(7,3,1), Edge(7,6,1))
	show partitioned edges
		graph.partitionBy(PartitionStrategy.EdgePartition2D, 4).edges.partitionsRDD.map(V => (V._1, V._2.srcIds, V._2.dstIds)).collect()
		Array[(org.apache.spark.graphx.PartitionID, Array[org.apache.spark.graphx.VertexId], Array[org.apache.spark.graphx.VertexId])] = Array(
			(0,
				Array(),
				Array()
			), 
			(1,
				Array(2, 4, 6, 6),
				Array(1, 1, 3, 7)
			), 
			(2,
				Array(1, 7),
				Array(2, 6)
			), 
			(3,
				Array(3, 7),
				Array(7, 3)
			)
		)
	
	show partitioned vertices
		graph.partitionBy(PartitionStrategy.EdgePartition2D, 4).vertices.partitionsRDD.partitions
		graph.partitionBy(PartitionStrategy.EdgePartition2D, 4).vertices.partitionsRDD.partitions.zipWithIndex
		graph.partitionBy(PartitionStrategy.EdgePartition2D, 4).vertices.partitionsRDD.zipWithIndex
		graph.partitionBy(PartitionStrategy.EdgePartition2D, 4).vertices.partitionsRDD.zipWithIndex.map(V => (V._1.index, V._2)).collect()

	show routing table (can infer edge partition)
		graph.partitionBy(PartitionStrategy.EdgePartition2D, 4).vertices.partitionsRDD.map(v => v.routingTable).map(v => v.routingTable).collect()
		Array[Array[(Array[org.apache.spark.graphx.VertexId], org.apache.spark.util.collection.BitSet, org.apache.spark.util.collection.BitSet)]] = Array(
			Array
			(
				(
					Array(),
					org.apache.spark.util.collection.BitSet@504b4b5d,org.apache.spark.util.collection.BitSet@7f40efd9
				), 
				(
					Array(4, 1, 6, 3, 7, 2),
					org.apache.spark.util.collection.BitSet@42d0d4,org.apache.spark.util.collection.BitSet@229c0e6e
				), 
				(
					Array(1, 6, 7, 2),
					org.apache.spark.util.collection.BitSet@33776982,org.apache.spark.util.collection.BitSet@64aff033
				), s
				(
					Array(3, 7),
					org.apache.spark.util.collection.BitSet@5ac2d7e9,org.apache.spark.util.collection.BitSet@2ded308c)
				)
			)

		scala> val a = graph.partitionBy(PartitionStrategy.EdgePartition2D, 4).vertices.partitionsRDD.map(v => v.routingTable).map(v => v.routingTable).collect()
		scala> a(0)
		res50: Array[(Array[org.apache.spark.graphx.VertexId], org.apache.spark.util.collection.BitSet, org.apache.spark.util.collection.BitSet)] = Array(
			(Array(),org.apache.spark.util.collection.BitSet@44624e03,org.apache.spark.util.collection.BitSet@11efca08), 
			(Array(4),org.apache.spark.util.collection.BitSet@15b8dc6b,org.apache.spark.util.collection.BitSet@1b8efff1), 
			(Array(),org.apache.spark.util.collection.BitSet@49453559,org.apache.spark.util.collection.BitSet@5eb18ba3), 
			(Array(),org.apache.spark.util.collection.BitSet@5a46aae6,org.apache.spark.util.collection.BitSet@557e1057)
		)

		scala> a(1)
		res51: Array[(Array[org.apache.spark.graphx.VertexId], org.apache.spark.util.collection.BitSet, org.apache.spark.util.collection.BitSet)] = Array(
			(Array(),org.apache.spark.util.collection.BitSet@4762eb9a,org.apache.spark.util.collection.BitSet@2f59f013), 
			(Array(1),org.apache.spark.util.collection.BitSet@39a087ae,org.apache.spark.util.collection.BitSet@5a2bce10), 
			(Array(1),org.apache.spark.util.collection.BitSet@71e5aaaf,org.apache.spark.util.collection.BitSet@1d290194), 
			(Array(),org.apache.spark.util.collection.BitSet@6f26aa80,org.apache.spark.util.collection.BitSet@5383f282)
		)

		scala> a(2)
		res52: Array[(Array[org.apache.spark.graphx.VertexId], org.apache.spark.util.collection.BitSet, org.apache.spark.util.collection.BitSet)] = Array(
			(Array(),org.apache.spark.util.collection.BitSet@7ba65fa3,org.apache.spark.util.collection.BitSet@67d105c0), 
			(Array(6, 2),org.apache.spark.util.collection.BitSet@4bd0b57f,org.apache.spark.util.collection.BitSet@733bcbbb), 
			(Array(6, 2),org.apache.spark.util.collection.BitSet@5abc9d17,org.apache.spark.util.collection.BitSet@14ed7f8b), 
			(Array(),org.apache.spark.util.collection.BitSet@74508968,org.apache.spark.util.collection.BitSet@536d4680)
		)

		scala> a(3)
		res53: Array[(Array[org.apache.spark.graphx.VertexId], org.apache.spark.util.collection.BitSet, org.apache.spark.util.collection.BitSet)] = Array(
			(Array(),org.apache.spark.util.collection.BitSet@2b2fa84a,org.apache.spark.util.collection.BitSet@45d1a86c), 
			(Array(3, 7),org.apache.spark.util.collection.BitSet@47886e43,org.apache.spark.util.collection.BitSet@4dff1565), 
			(Array(7),org.apache.spark.util.collection.BitSet@25d5c1e4,org.apache.spark.util.collection.BitSet@74ac7323), 
			(Array(3, 7),org.apache.spark.util.collection.BitSet@65bb3aac,org.apache.spark.util.collection.BitSet@67092661))

observation
	VertexRDD.scala
		val routingTables = createRoutingTables(edges, new HashPartitioner(numPartitions)) ...
		private def createRoutingTables( ...

Fri Jul 25 16:52:53 CST 2014
try HDFS
try twitter?

Fri Jul 25 15:33:01 2014 BiCut


Fri Jul 25 11:11:36 2014 Test

> export i=HybridCut

> ./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar graphx/data/soc-LiveJournal1.txt --tol=1 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=6 -partStrategy=$i 2>&1 | tee $(date +"%Y%m%d-%H%M")_$i.txt

Fri Jul 25 10:49:21 2014 Use RDD to Partition

scala> graph.edges.map(e => (e.dstId, e.srcId, e.attr))
res0: org.apache.spark.rdd.RDD[(org.apache.spark.graphx.VertexId, org.apache.spark.graphx.VertexId, Int)] = MappedRDD[12] at map at <console>:18

scala> graph.inDegrees
res1: org.apache.spark.graphx.VertexRDD[Int] = VertexRDD[16] at RDD at VertexRDD.scala:58

scala> graph.inDegrees.map(e => (e._1, e._2))
res3: org.apache.spark.rdd.RDD[(org.apache.spark.graphx.VertexId, Int)] = MappedRDD[17] at map at <console>:18

scala> var b = graph.edges.map(e => (e.dstId, (e.srcId, e.attr)))
b: org.apache.spark.rdd.RDD[(org.apache.spark.graphx.VertexId, (org.apache.spark.graphx.VertexId, Int))] = MappedRDD[20] at map at <console>:17

scala> graph.edges.map(e => (e.dstId, (e.srcId, e.attr))).join(graph.inDegrees.map(e => (e._1, e._2)))
res11: org.apache.spark.rdd.RDD[(org.apache.spark.graphx.VertexId, ((org.apache.spark.graphx.VertexId, Int), Int))] = FlatMappedValuesRDD[31] at join at <console>:18

._1 e.dstId
._2._2 degrees
._2._1._1 e.srdId
._2._1._2 e.attr

._2 ((e.srcId, e.attr), degrees)
._2._1 (e.srcId, e.attr)

Fri Jul 25 09:34:39 2014 Replication Factor

- partition
	graph.partitionBy(PartitionStrategy.EdgePartition2D, 6).edges.partitionsRDD

- vertices by partition
	graph.partitionBy(PartitionStrategy.EdgePartition2D, 6).edges.partitionsRDD.mapValues((V) => (V.indexSize+ V.reverse.indexSize)).toArray

- total replications of vertices
	graph.partitionBy(PartitionStrategy.EdgePartition2D, 6).edges.partitionsRDD.mapValues((V) => (V.indexSize+ V.reverse.indexSize)).map(a => a._2).reduce((a, b) => a+b)

- http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.rdd.PairRDDFunctions
- http://spark.apache.org/docs/latest/programming-guide.html#rdd-operations
- http://docs.scala-lang.org/tutorials/tour/anonymous-function-syntax.html

Thu Jul 24 16:25:08 2014

http://apache-spark-user-list.1001560.n3.nabble.com/java-lang-NullPointerException-met-when-computing-new-RDD-or-use-count-td2766.html
	It looks like you're trying to access an RDD ("D") from inside a closure -- the parameter to the first map) which isn't possible with the current implementation of Spark.  Can you rephrase to not access D from inside the map call?
http://stackoverflow.com/questions/23400110/null-pointer-exception-in-spark-rdd-rdd-take
	One way that this comes up is that RDD's cannot be referenced in the closure of a map call.
http://stackoverflow.com/questions/23793117/nullpointerexception-in-scala-spark-appears-to-be-caused-be-collection-type
	Spark doesn't support nesting of RDDs (see http://stackoverflow.com/a/14130534/590203 for another occurrence of the same problem), so you can't perform transformations or actions on RDDs inside of other RDD operations.
	In the first case, you're seeing a NullPointerException thrown by the worker when it tries to access a SparkContext object that's only present on the driver and not the workers.
	In the second case, my hunch is the job was run locally on the driver and worked purely by accident.



Thu Jul 24 15:55:19 2014

alt. way: use spark example
for i in HybridCut EdgePartition2D EdgePartition1D RandomVertexCut CanonicalRandomVertexCut; do
./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar graphx/data/soc-LiveJournal1.txt --tol=1 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=6 -partStrategy=$i | tee $(date +"%Y%m%d-%H%M")_$i.txt;
echo "./bin/spark-submit --class org.apache.spark.examples.graphx.LiveJournalPageRank examples/target/scala-2.10/spark-examples-1.1.0-SNAPSHOT-hadoop1.0.4.jar graphx/data/soc-LiveJournal1.txt --tol=1 --output=output/$(date +"%Y%m%d-%H%M")_$i --numEPart=6 -partStrategy=$i | tee $(date +"%Y%m%d-%H%M")_$i.txt";
done

grep
	get time
		14/07/24 15:55:29 INFO GraphLoader: It took 143412 ms to load the edges
		14/07/24 15:55:29 INFO GraphImpl: It took 68 ms to partition

		14/07/24 15:58:54 INFO DAGScheduler: Stage 13 (mapPartitions at VertexRDD.scala:347) finished in 72.275 s
		14/07/24 15:58:56 INFO TaskSetManager: Finished TID 56 in 74825 ms on brick0.ipads-lab.se.sjtu.edu.cn (progress: 6/6)
		14/07/24 15:58:56 INFO DAGScheduler: Stage 15 (mapPartitions at VertexRDD.scala:347) finished in 74.840 s

		14/07/24 15:59:09 INFO Pregel: [Pregel] It took 94629 ms to finish execution.

	verify result
		println("GRAPHX: Number of vertices " + graph.vertices.count)
		println("GRAPHX: Number of edges " + graph.edges.count)
		println("GRAPHX: Total rank: " + pr.map(_._2).reduce(_ + _))

Thu Jul 24 15:45:13 2014
./bin/spark-submit --class "Partitioning" application/arkansol/target/scala-2.10/-1.0.jar

externalresolvers
maven

how to use local spark build?

Thu Jul 24 15:01:26 2014

https://spark.apache.org/docs/latest/quick-start.html#standalone-applications
./bin/spark-submit --class "SimpleApp" application/tutorial/target/scala-2.10/simple-project_2.10-1.0.jar


Thu Jul 24 10:51:15 2014

| graph     | partition       | algorithm       | load | ingress | compute |
| powerlyra | EdgePartition2D | PageRank(0.001) |      | 69ms    | 6674ms  |
|           | EdgePartition1D |                 |      | 7       | 3823    |
|           |                 |                 |      |         |         |


(on Google Docs)

Wed Jul 23 16:03:21 2014

import org.apache.spark.graphx._

val graph = GraphLoader.edgeListFile(sc, "graphx/data/powerlyra.txt")
val graph = GraphLoader.edgeListFile(sc, "graphx/data/followers.txt")
val graph = GraphLoader.edgeListFile(sc, "graphx/data/split1.txt")

val graph = GraphLoader.edgeListFile(sc, "graphx/data/soc-LiveJournal1.txt")


graph.partitionBy(PartitionStrategy.EdgePartition2D, 6)
graph.partitionBy(PartitionStrategy.EdgePartition1D, 6)
graph.partitionBy(PartitionStrategy.RandomVertexCut, 6)
graph.partitionBy(PartitionStrategy.CanonicalRandomVertexCut, 6)
graph.partitionBy(PartitionStrategy.HybridCut, 6)

graph.pageRank(0.001)
...

val inDegrees: VertexRDD[Int] = graph.inDegrees


Tue Jul 22 21:57:13 2014
./sbt/sbt assembly
./sbin/start-all.sh
./bin/spark-shell --master spark://brick0:7077

Tue Jul 22 16:25:56 2014
jps - Java Virtual Machine Process Status Tool

Tue Jul 22 14:00:25 2014
deploy
[Cluster Mode Overview - Spark 1.0.1 Documentation](https://spark.apache.org/docs/latest/cluster-overview.html)
[Spark Standalone Mode - Spark 1.0.1 Documentation](https://spark.apache.org/docs/latest/spark-standalone.html)
[Installing Spark and Setting Up Your Cluster - Apache Spark Documentation](http://docs.sigmoidanalytics.com/index.php/Installing_Spark_and_Setting_Up_Your_Cluster)

samba
[SambaServerSimple - Debian Wiki](https://wiki.debian.org/SambaServerSimple)


sudo smbmount \\\\brick0\\xiaodi xiaodi -o username=xiaodi
mount root, user xiaodi, owner marcus?

brick0 main
brick1
	sudo smbmount \\\\brick0\\xiaodi /data/sdd1/xiaodi -o username=xiaodi,password=ppi123,uid=1017,gid=1019
brick2
	sudo smbmount \\\\brick0\\xiaodi /data/sdd1/xiaodi -o username=xiaodi,password=ppi123,uid=1015,gid=1018
brick3
	sudo smbmount \\\\brick0\\xiaodi /data/sdd1/xiaodi -o username=xiaodi,password=ppi123,uid=1018,gid=1020
brick4
	sudo smbmount \\\\brick0\\xiaodi /data/sdd1/xiaodi -o username=xiaodi,password=ppi123,uid=1017,gid=1020
brick5
	sudo smbmount \\\\brick0\\xiaodi /data/sdd1/xiaodi -o username=xiaodi,password=ppi123,uid=1013,gid=1016

/etc/exports
the access control list for filesystems which may be exported to NFS clients.  See exports(5).

#xiaodi-nfs
/data/sdd1/xiaodi *(rw,sync,no_root_squash,no_subtree_check)

sudo mount -t nfs brick0://data/sdd1/xiaodi /data/sdd1/xiaodi


<!-- ? nfs, cifs, smb -->

other solutions

rsync
hdfs


Mon Jul 21 09:29:06 2014

分析原来的问题
eg. EdgePartition2D 平方数

测试的方法
ingress time (cluster)
replication factor (local 模拟)

Sun Jul 20 22:29:06 2014
