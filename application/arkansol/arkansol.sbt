name := "Partitioning HybridCut pageRank(1)"

version := "1.0"

scalaVersion := "2.10.4"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % "1.0.1",
  "org.apache.spark" %% "spark-graphx" % "1.0.1"
)

// resolvers += "Akka Repository" at "http://repo.akka.io/releases/"
