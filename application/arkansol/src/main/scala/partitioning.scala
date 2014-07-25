/* partitioning.scala */
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf
import org.apache.spark.graphx._

object Partitioning {
  def main(args: Array[String]) {
    val conf = new SparkConf().setAppName("Parition Hybrid PR 1")
    val sc = new SparkContext(conf)
    val graph = GraphLoader.edgeListFile(sc, "graphx/data/soc-LiveJournal1.txt")
    val parts : Int = 6
    graph.partitionBy(PartitionStrategy.HybridCut).pageRank(1)
    // graph.partitionBy(PartitionStrategy.HybridCut, parts).pageRank(1)
    println("Ark Ok")
  }
}
