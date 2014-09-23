package org.apache.spark.examples.benchmark

import scala.collection.mutable
import org.apache.spark._
import org.apache.spark.storage.StorageLevel
import org.apache.spark.graphx._
import org.apache.spark.graphx.PartitionStrategy._

// for PairRDDFunctions
import org.apache.spark.SparkContext._

object GraphXPartition extends Logging {
  def main(args: Array[String]) {
    if (args.length < 2) {
      System.err.println(
        "Usage: GraphXPartition <file> <strategy> --numEPart=<num_edge_partitions> --threshHold=<threshold> [other options]")
      System.exit(1)
    }
    val optionsList = args.drop(2).map { arg =>
      arg.dropWhile(_ == '-').split('=') match {
        case Array(opt, v) => (opt -> v)
        case _ => throw new IllegalArgumentException("Invalid argument: " + arg)
    }
      }
      // TODO: add threshold option
      val options = mutable.Map(optionsList: _*)

      def pickPartitioner(v: String): PartitionStrategy = {
        // TODO: Use reflection rather than listing all the partitioning strategies here.
        v match {
          case "RandomVertexCut" => RandomVertexCut
          case "EdgePartition1D" => EdgePartition1D
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

        val threshHold = options.remove("threshHold").map(_.toInt).getOrElse(70)

        val numEPart = options.remove("numEPart").map(_.toInt).getOrElse {
          println("Set the number of edge partitions using --numEPart.")
          sys.exit(1)
      }

        val fname = args(0)
        val StrategyName = args(1)
        val partitionStrategy: PartitionStrategy = pickPartitioner(StrategyName)
        val edgeStorageLevel = options.remove("edgeStorageLevel").map(StorageLevel.fromString(_)).getOrElse(StorageLevel.MEMORY_ONLY)
        val vertexStorageLevel = options.remove("vertexStorageLevel").map(StorageLevel.fromString(_)).getOrElse(StorageLevel.MEMORY_ONLY)
        val reverse = options.remove("reverse").map(_.toBoolean).getOrElse(false)
        var reverseString = ""

        println("======================================")
        println("|     benchmark: GraphXPartition     |")
        println("======================================")

        val sc = new SparkContext(
          conf.setAppName("PageRank(" + fname + ") " + StrategyName)
            .set("spark.kryoserializer.buffer.mb","96")
            .set("spark.akka.frameSize","96")
            )

        var unpartitionedGraph = GraphLoader.edgeListFile(sc, fname,
          minEdgePartitions = numEPart,
          edgeStorageLevel = edgeStorageLevel,
          vertexStorageLevel = vertexStorageLevel).cache()

        if (reverse) {
          unpartitionedGraph = unpartitionedGraph.reverse 
          reverseString = "-reverse"
        }
        val graph = unpartitionedGraph.partitionBy(partitionStrategy, numEPart, threshHold)
        // val graph = partitionStrategy.foldLeft(unpartitionedGraph)(_.partitionBy(_))

        // count replications
        val replications = graph.edges.partitionsRDD.mapValues((V) => (Set(V.srcIds: _*) ++ Set(V.dstIds: _*)).size).map(a => a._2).reduce((a, b) => a+b)

        logInfo("GRAPHX: INPUT " + fname + reverseString)
        logInfo("GRAPHX: PatitionStrategy " + StrategyName)
        logInfo("GRAPHX: ThreshHold " + threshHold)
        logInfo("GRAPHX: Number of vertices " + graph.vertices.count)
        logInfo("GRAPHX: Number of edges " + graph.edges.count)
        logInfo("GRAPHX: Number of replications " + replications)
        logInfo("GRAPHX: Number of partitions " + numEPart)

        }
  }
