#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Larry Xiao
# @Date:   2014-07-30 09:22:13
# @Last Modified by:   Larry Xiao
# @Last Modified time: 2014-07-30 09:30:18

import sys
import numpy

# pagerank output format
# from lib/Analytics.scala
output = []
for line in sys.stdin:
	if "GraphLoader" in line:
		output.append(line.split('_')[0])
		output.append(line.split()[6])
	if "GraphImpl" in line:
		output.append(line.split()[6])
	if "INPUT" in line:
		output.append(line[line.index('INPUT')+5:-1])
	if "Requirement" in line:
		output.append(line.split()[-1])
	if "PatitionStrategy" in line:
		output.append(line.split()[-1])
	if "vertices" in line and "stat_vertices" not in line:
		output.append(line.split()[-1])
	if "GRAPHX" in line and "edges" in line and "stat_edges" not in line:
#		print line.split()[-1]
		output.append(line.split()[-1])
	if "replications" in line:
#		print line.split()[-1]
		output.append(line.split()[-1])
	if "Pregel" in line:
#		print line.split()[7]
		output.append(line.split()[7])
	if "rank" in line:
#		print line.split()[-1]
		output.append(line.split()[-1])
	if "partitions" in line:
#		print line.split()[-1]
		output.append(line.split()[-1])
	if "ThreshHold" in line:
#		print line.split()[-1]
		output.append(line.split()[-1])
	if "stat_vertices" in line:
		stringlist = line.split("Array")[1].replace("(","").replace(")","").split(",")[1::2]
#		print stringlist
		intlist = map(int, stringlist)
		narray = numpy.array(intlist)
		output.append("vertices")
		output.append(str(numpy.std(narray)))
		output.append(str(numpy.average(narray)))
		output.append(str(numpy.min(narray)))
		output.append(str(numpy.max(narray)))
	if "stat_edges" in line:
		stringlist = line.split("Array")[1].replace("(","").replace(")","").split(",")[1::2]
#		print stringlist
		intlist = map(int, stringlist)
		narray = numpy.array(intlist)
		output.append("edges")
		output.append(str(numpy.std(narray)))
		output.append(str(numpy.average(narray)))
		output.append(str(numpy.min(narray)))
		output.append(str(numpy.max(narray)))

for i in [','.join(output[20 * i: 20 * i + 20]) for i in range(0, len(output) / 20)]:
	print i
# for i in [','.join(output[10 * i: 10 * i + 10]) for i in range(0, len(output) / 10)]:
#	print i
