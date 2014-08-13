#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Larry Xiao
# @Date:   2014-07-30 09:22:13
# @Last Modified by:   Larry Xiao
# @Last Modified time: 2014-07-30 09:30:18

import sys
import numpy

class ReportEntry:
	DateTime = ''
	TimetoLoad = ''
	TimetoPartition = ''
	Data = ''
	Strategy = ''
	ThreshHold = ''
	Vertices = ''
	Edges = ''
	Replications = ''
	NumParts = ''
	Factor = ''
	BalanceVertex = []
	BalanceEdge = []
	Requirement = ''
	TimetoExecute = ''
	Result = ''

out = ReportEntry()
# out.Factor = '1'
# out.BalanceVertex.append('a')
# print vars(out)

# pagerank output format
# from lib/Analytics.scala
for line in sys.stdin:
	if "GraphLoader" in line:
		out.DateTime = line.split('INFO')[0]
		out.TimetoLoad = (line.split()[6])
	if "GraphImpl" in line:
		out.TimetoPartition = (line.split()[6])
	if "INPUT" in line:
		out.Data = (line[line.index('INPUT')+5:-1])
	if "Requirement" in line:
		out.Requirement = (line.split()[-1])
	if "PatitionStrategy" in line:
		out.Strategy = (line.split()[-1])
	if "vertices" in line and "stat_vertices" not in line:
		out.Vertices = (line.split()[-1])
	if "GRAPHX" in line and "edges" in line and "stat_edges" not in line:
		out.Edges = (line.split()[-1])
	if "replications" in line:
		out.Replications = (line.split()[-1])
	if "Pregel" in line:
		out.TimetoExecute = (line.split()[7])
	if "rank" in line:
		out.Result = (line.split()[-1])
	if "partitions" in line:
		out.NumParts = (line.split()[-1])
	if "ThreshHold" in line:
		out.ThreshHold = (line.split()[-1])
	if "stat_vertices" in line:
		stringlist = line.split("Array")[1].replace("(","").replace(")","").split(",")[1::2]
#		print stringlist
		intlist = map(int, stringlist)
		narray = numpy.array(intlist)
		out.BalanceVertex.append("vertices")
		out.BalanceVertex.append(str(numpy.std(narray)))
		out.BalanceVertex.append(str(numpy.average(narray)))
		out.BalanceVertex.append(str(numpy.min(narray)))
		out.BalanceVertex.append(str(numpy.max(narray)))
		out.BalanceVertex.append(str((numpy.max(narray)-numpy.min(narray)/numpy.average(narray))))
	if "stat_edges" in line:
		stringlist = line.split("Array")[1].replace("(","").replace(")","").split(",")[1::2]
#		print stringlist
		intlist = map(int, stringlist)
		narray = numpy.array(intlist)
		out.BalanceEdge.append("edges")
		out.BalanceEdge.append(str(numpy.std(narray)))
		out.BalanceEdge.append(str(numpy.average(narray)))
		out.BalanceEdge.append(str(numpy.min(narray)))
		out.BalanceEdge.append(str(numpy.max(narray)))
		out.BalanceEdge.append(str((numpy.max(narray)-numpy.min(narray)/numpy.average(narray))))

out.Factor = str( float(out.Replications) / float(out.Vertices) )
#print out.DateTime
#print out.TimetoLoad
#print out.TimetoPartition
#print out.Data
#print out.Strategy
#print out.ThreshHold
#print out.Vertices
#print out.Edges
#print out.Replications
#print out.NumParts
#print out.Factor
#for i in out.BalanceVertex:
#	print i
#for i in out.BalanceEdge:
#	print i
#print out.Requirement
#print out.TimetoExecute
#print out.Result

sys.stdout.write( out.DateTime + ',' )
sys.stdout.write( out.TimetoLoad + ',' )
sys.stdout.write( out.TimetoPartition + ',' )
sys.stdout.write( out.Data + ',' )
sys.stdout.write( out.Strategy + ',' )
sys.stdout.write( out.ThreshHold + ',' )
sys.stdout.write( out.Vertices + ',' )
sys.stdout.write( out.Edges + ',' )
sys.stdout.write( out.Replications + ',' )
sys.stdout.write( out.NumParts + ',' )
sys.stdout.write( out.Factor + ',' )
for i in out.BalanceVertex: 
	sys.stdout.write( i + ',' )
for i in out.BalanceEdge: 
	sys.stdout.write( i + ',' )
sys.stdout.write( out.Requirement + ',' )
sys.stdout.write( out.TimetoExecute + ',' )
sys.stdout.write( out.Result + '\n' )
