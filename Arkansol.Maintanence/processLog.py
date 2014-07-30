#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Larry Xiao
# @Date:   2014-07-30 09:22:13
# @Last Modified by:   Larry Xiao
# @Last Modified time: 2014-07-30 09:30:18

import sys

# pagerank output format
# from lib/Analytics.scala
output = []
for line in sys.stdin:
	if "GraphLoader" in line:
		output.append(line.split('_')[0])
	#	output.append(line[line.index('_')+1:line.index('.txt')])
	#	output.append(line[line.index('took')+5:line.index('ms')-1])
		output.append(line.split()[6])
	if "GraphImpl" in line:
		output.append(line.split()[6])
	if "INPUT" in line:
		output.append(line[line.index('INPUT')+5:-1])
	if "Requirement" in line:
		output.append(line.split()[-1])
	if "PatitionStrategySome" in line:
		output.append(line[line.index('PatitionStrategySome')+21:-2])
	if "vertices" in line:
		output.append(line.split()[-1])
	if "GRAPHX" in line and "edges" in line:
		output.append(line.split()[-1])
	if "replications" in line:
		output.append(line.split()[-1])
	if "Pregel" in line:
		output.append(line.split()[7])
	if "rank" in line:
		output.append(line.split()[-1])
for i in [','.join(output[11 * i: 11 * i + 11]) for i in range(0, len(output) / 11)]:
	print i
