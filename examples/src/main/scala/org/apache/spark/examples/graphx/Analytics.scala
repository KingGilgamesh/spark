/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.spark.examples.graphx

import scala.collection.mutable
import org.apache.spark._
import org.apache.spark.storage.StorageLevel
import org.apache.spark.graphx._
import org.apache.spark.graphx.lib._
import org.apache.spark.graphx.PartitionStrategy._

// for PairRDDFunctions
import org.apache.spark.SparkContext._

/**
 * Driver program for running graph algorithms.
 */
object Analytics extends Logging {

  def main(args: Array[String]): Unit = {
    if (args.length < 2) {
      System.err.println(
        "Usage: Analytics <taskType> <file> --numEPart=<num_edge_partitions> [other options]")
      System.exit(1)
    }

    val taskType = args(0)
    val fname = args(1)
    val optionsList = args.drop(2).map { arg =>
      arg.dropWhile(_ == '-').split('=') match {
        case Array(opt, v) => (opt -> v)
        case _ => throw new IllegalArgumentException("Invalid argument: " + arg)
      }
    }
    val options = mutable.Map(optionsList: _*)

    def pickPartitioner(v: String): PartitionStrategy = {
      // TODO: Use reflection rather than listing all the partitioning strategies here.
      v match {
        case "RandomVertexCut" => RandomVertexCut
        case "EdgePartition1DSrc" => EdgePartition1DSrc
        case "EdgePartition1DDst" => EdgePartition1DDst
        case "EdgePartition2D" => EdgePartition2D
        case "CanonicalRandomVertexCut" => CanonicalRandomVertexCut
        case "HybridCut" => HybridCut
        case "GreedyHybridCut" => GreedyHybridCut
        case "BiSrcCut" => BiSrcCut
        case "BiDstCut" => BiDstCut
        case _ => throw new IllegalArgumentException("Invalid PartitionStrategy: " + v)
      }
    }

    val conf = new SparkConf()
      .set("spark.serializer", "org.apache.spark.serializer.KryoSerializer")
      .set("spark.kryo.registrator", "org.apache.spark.graphx.GraphKryoRegistrator")
      .set("spark.locality.wait", "100000")

    val numEPart = options.remove("numEPart").map(_.toInt).getOrElse {
      println("Set the number of edge partitions using --numEPart.")
      sys.exit(1)
    }

    val StrategyName = options.remove("partStrategy")
    val partitionStrategy: Option[PartitionStrategy] = StrategyName
      .map(pickPartitioner(_))
    val edgeStorageLevel = options.remove("edgeStorageLevel")
      .map(StorageLevel.fromString(_)).getOrElse(StorageLevel.MEMORY_ONLY)
    val vertexStorageLevel = options.remove("vertexStorageLevel")
      .map(StorageLevel.fromString(_)).getOrElse(StorageLevel.MEMORY_ONLY)

    taskType match {
      case "pagerank" =>
        val tol = options.remove("tol").map(_.toFloat).getOrElse(0.001F)
        val outFname = options.remove("output").getOrElse("")
        val numIterOpt = options.remove("numIter").map(_.toInt)

        options.foreach {
          case (opt, _) => throw new IllegalArgumentException("Invalid option: " + opt)
        }

        println("======================================")
        println("|             PageRank               |")
        println("======================================")

        val sc = new SparkContext(
		conf.setAppName("PageRank(" + fname + ") " + StrategyName)
		.set("spark.kryoserializer.buffer.mb","96")
		.set("spark.akka.frameSize","96")
	)

       val unpartitionedGraph = GraphLoader.edgeListFile(sc, fname,
          minEdgePartitions = numEPart,
          edgeStorageLevel = edgeStorageLevel,
          vertexStorageLevel =
            vertexStorageLevel).cache()
        val graph = partitionStrategy.foldLeft(unpartitionedGraph)(_.partitionBy(_))
        logInfo("GRAPHX: INPUT" + fname)
        logInfo("GRAPHX: Requirement PageRank " + tol)
        logInfo("GRAPHX: PatitionStrategy " + StrategyName)
        logInfo("GRAPHX: Number of vertices " + graph.vertices.count)
        logInfo("GRAPHX: Number of edges " + graph.edges.count)
        // count replications
        // wrong
        // 1->3 1->2 2->1 yield 4 instead of 3
        // val replications = graph.edges.partitionsRDD.mapValues((V) => (V.indexSize+ V.reverse.indexSize)).map(a => a._2).reduce((a, b) => a+b)
        val replications = graph.edges.partitionsRDD.mapValues((V) => (Set(V.srcIds: _*) ++ Set(V.dstIds: _*)).size).map(a => a._2).reduce((a, b) => a+b)

        logInfo("GRAPHX: Number of replications " + replications)

        val pr = (numIterOpt match {
          case Some(numIter) => PageRank.run(graph, numIter)
          case None => PageRank.runUntilConvergence(graph, tol)
        }).vertices.cache()

        logInfo("GRAPHX: Total rank: " + pr.map(_._2).reduce(_ + _))

        if (!outFname.isEmpty) {
          logWarning("Saving pageranks of pages to " + outFname)
          pr.map{case (id, r) => id + "\t" + r}.saveAsTextFile(outFname)
        }

        sc.stop()

      case "cc" =>
        options.foreach {
          case (opt, _) => throw new IllegalArgumentException("Invalid option: " + opt)
        }

        println("======================================")
        println("|      Connected Components          |")
        println("======================================")

        val sc = new SparkContext(conf.setAppName("ConnectedComponents(" + fname
          + ")_" + numEPart + "_" + StrategyName ))
        val unpartitionedGraph = GraphLoader.edgeListFile(sc, fname,
          minEdgePartitions = numEPart,
          edgeStorageLevel = edgeStorageLevel,
          vertexStorageLevel = vertexStorageLevel).cache()
        val graph = partitionStrategy.foldLeft(unpartitionedGraph)(_.partitionBy(_))

        val cc = ConnectedComponents.run(graph)
        println("Components: " + cc.vertices.map{ case (vid,data) => data}.distinct())
        // count replications
        val replications = graph.edges.partitionsRDD.mapValues((V) => (Set(V.srcIds: _*) ++ Set(V.dstIds: _*)).size).map(a => a._2).reduce((a, b) => a+b)

        logInfo("GRAPHX: INPUT " + fname )
        logInfo("GRAPHX: PatitionStrategy " + StrategyName)
        logInfo("GRAPHX: Number of vertices " + graph.vertices.count)
        logInfo("GRAPHX: Number of edges " + graph.edges.count)
        logInfo("GRAPHX: Number of replications " + replications)
        logInfo("GRAPHX: Number of partitions " + numEPart)

        // unique vertices per partition
        import scala.runtime.ScalaRunTime._
        val vertices = stringOf(graph.edges.partitionsRDD.mapValues((V) => (Set(V.srcIds: _*) ++ Set(V.dstIds: _*)).size).collect())
        logInfo("GRAPHX: stat_vertices " + vertices) 

        // edges per partition
        val edges  = stringOf(graph.edges.partitionsRDD.mapValues((V) => (V.dstIds.length)).collect())
        logInfo("GRAPHX: stat_edges " + edges) 

        logInfo("GRAPHX: Requirement CC")
        sc.stop()

      case "triangles" =>
        options.foreach {
          case (opt, _) => throw new IllegalArgumentException("Invalid option: " + opt)
        }

        println("======================================")
        println("|      Triangle Count                |")
        println("======================================")

        val sc = new SparkContext(conf.setAppName("TriangleCount(" + fname + ")"))
        val graph = GraphLoader.edgeListFile(sc, fname,
          canonicalOrientation = true,
          minEdgePartitions = numEPart,
          edgeStorageLevel = edgeStorageLevel,
          vertexStorageLevel = vertexStorageLevel)
        // TriangleCount requires the graph to be partitioned
          .partitionBy(partitionStrategy.getOrElse(RandomVertexCut)).cache()
        val triangles = TriangleCount.run(graph)
        println("Triangles: " + triangles.vertices.map {
          case (vid, data) => data.toLong
        }.reduce(_ + _) / 3)
        sc.stop()

      case _ =>
        println("Invalid task type.")
    }
  }
}
