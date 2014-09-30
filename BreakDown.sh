#! /bin/bash
#################################################################################
#     File Name           :     BreakDown.sh
#     Created By          :     xiaodi
#     Creation Date       :     [2014-09-29 20:51]
#     Last Modified       :     [2014-09-30 13:57]
#     Description         :      
#################################################################################

# (reduce VertexRDD.scala:111) 0.239
#(mapPartitions VertexRDD.scala:347) 0.419
#(mapPartitions VertexRDD.scala:352) 0.563
#(mapPartitions GraphImpl.scala:411) 5.910

#grep "mapPartitions at GraphImpl.scala:411) finished \|reduce at VertexRDD.scala:111) finished \|mapPartitions at VertexRDD.scala:347) finished \|mapPartitions at VertexRDD.scala:352) finished" $1 | awk '{print $7,$9,$12}'

echo "mapPartitions at GraphImpl.scala:411"
echo $(grep "mapPartitions at GraphImpl.scala:411) finished" $1 | awk '{print $12}' ) | tr "\n" "\t\t"
echo

echo "reduce at VertexRDD.scala:111"
echo $(grep "reduce at VertexRDD.scala:111) finished" $1 | awk '{print $12}' ) | tr "\n" "\t\t"
echo

echo "mapPartitions at VertexRDD.scala:347"
echo $(grep "mapPartitions at VertexRDD.scala:347) finished" $1 | awk '{print $12}' ) | tr "\n" "\t\t"
echo

echo "mapPartitions at VertexRDD.scala:352"
echo $(grep "mapPartitions at VertexRDD.scala:352) finished" $1 | awk '{print $12}' ) | tr "\n" "\t\t"
echo


