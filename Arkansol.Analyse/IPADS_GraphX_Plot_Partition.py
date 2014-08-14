#! /usr/bin/env python
#################################################################################
#     File Name           :     IPADS_GraphX_Plot.py
#     Created By          :     xiaodi
#     Creation Date       :     [2014-08-13 08:46]
#     Last Modified       :     [2014-08-14 22:04]
#     Description         :      
#################################################################################

# Time  Load    Partition       Data    Strategy        Threshold       Vertices        Edges   Replications    NumParts        Factor          stddev  avg     min     max                     stddev  avg     min     max     
# 20140812-2011,11348,105, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,HybridCut,0,1000000,8179662,3480904,16,3.480904,vertices,139.720703548,217556.5,217231,217807,0.002647588098,edges,0.695970545354,511228.875,511228,511230,0.000003912142091
# 20140812-2012,11372,106, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,HybridCut,1000000,1000000,8179662,7125874,16,7.125874,vertices,66531.0864313,445367.125,374997,623511,0.5579980786,edges,114540.481712,511228.875,392679,843821,0.8824658036
# 20140812-2012,10929,105, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,HybridCut,100,1000000,8179662,3789756,16,3.789756,vertices,1166.5307272,236859.75,234989,239127,0.01747025402,edges,1519.62412602,511228.875,508949,513901,0.009686463817
# 20140812-2013,10934,24, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,EdgePartition2D,0,1000000,8179662,4976609,16,4.976609,vertices,43705.432858,311038.0625,230625,347599,0.3760761595,edges,40658.8290594,511228.875,452561,567485,0.2247995088
# 20140812-2014,11280,22, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,EdgePartition1DDst,0,1000000,8179662,7125874,16,7.125874,vertices,66531.0864313,445367.125,374997,623511,0.5579980786,edges,114540.481712,511228.875,392679,843821,0.8824658036
# 20140812-2015,11129,23, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,RandomVertexCut,0,1000000,8179662,7953123,16,7.953123,vertices,401.371277427,497070.1875,496114,497616,0.003021706064,edges,660.239528031,511228.875,510032,512646,0.005113169713
# 20140812-2015,11193,23, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,CanonicalRandomVertexCut,0,1000000,8179662,7953080,16,7.95308,vertices,521.414182776,497067.5,495757,498061,0.004635185362,edges,703.616628126,511228.875,509752,512223,0.004833451553
# 20140812-2016,13052,107, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,HybridCut,0,1000000,8179662,3688730,25,3.68873,vertices,155.248446047,147549.2,147331,147911,0.003930892204,edges,9.38986687872,327186.48,327167,327206,0.0001191980793
# 20140812-2018,13242,103, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,HybridCut,1000000,1000000,8179662,7798577,25,7.798577,vertices,70052.7796267,311943.08,240206,550682,0.9952969625,edges,92676.6116675,327186.48,231459,636202,1.237040724
# 20140812-2017,13251,104, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,HybridCut,100,1000000,8179662,3992878,25,3.992878,vertices,1262.69889744,159715.12,157800,162249,0.02785584734,edges,1497.14608826,327186.48,324773,330277,0.01682221099
# 20140812-2019,13090,23, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,EdgePartition2D,0,1000000,8179662,5607006,25,5.607006,vertices,25163.2584429,224280.24,169954,253262,0.3714460088,edges,57164.4456851,327186.48,268625,422743,0.4710402459
# 20140812-2019,13050,23, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,EdgePartition1DDst,0,1000000,8179662,7798577,25,7.798577,vertices,70052.7796267,311943.08,240206,550682,0.9952969625,edges,92676.6116675,327186.48,231459,636202,1.237040724
# 20140812-2020,12870,23, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,RandomVertexCut,0,1000000,8179662,8963526,25,8.963526,vertices,560.645947457,358541.04,357418,359602,0.006091352889,edges,631.597537677,327186.48,325858,328364,0.007659240687
# 20140812-2021,13460,23, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,CanonicalRandomVertexCut,0,1000000,8179662,8965461,25,8.965461,vertices,557.853893417,358618.44,357290,359665,0.006622637698,edges,632.364079941,327186.48,325660,328288,0.00803211673
# 20140812-2022,12819,103, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,HybridCut,0,1000000,8179662,3955644,48,3.955644,vertices,151.091790534,82409.25,82140,82736,0.007232197842,edges,235.032677249,170409.625,170240,170746,0.002969315847
# 20140812-2024,13235,101, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,HybridCut,1000000,1000000,8179662,8440782,48,8.440782,vertices,53850.2421565,175849.625,126650,436468,1.761834863,edges,61614.1471869,170409.625,113486,464422,2.059367245
# 20140812-2023,13156,102, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,HybridCut,100,1000000,8179662,4263219,48,4.263219,vertices,896.914117178,88817.0625,86929,90783,0.04339256323,edges,971.900964283,170409.625,168537,172766,0.02481667335
# 20140812-2024,13104,23, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,EdgePartition2D,0,1000000,8179662,6770593,48,6.770593,vertices,16175.1381428,141054.020833,109284,221935,0.7986372833,edges,29135.9185518,170409.625,146634,305638,0.9330693615
# 20140812-2025,13281,23, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,EdgePartition1DDst,0,1000000,8179662,8440782,48,8.440782,vertices,53850.2421565,175849.625,126650,436468,1.761834863,edges,61614.1471869,170409.625,113486,464422,2.059367245
# 20140812-2026,12799,23, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,RandomVertexCut,0,1000000,8179662,10109881,48,10.109881,vertices,477.444935288,210622.520833,209523,211580,0.009766287061,edges,431.044643135,170409.625,169530,171233,0.009993566971
# 20140812-2027,13096,22, /data/sdd1/xiaodi/data/in-2.0-1m V1000000 E8179662,CanonicalRandomVertexCut,0,1000000,8179662,10108498,48,10.108498,vertices,452.356881526,210593.708333,209842,211920,0.00986734132,edges,411.01016943,170409.625,169777,171285,0.00884926541

import numpy as np
import matplotlib.pyplot as plt

# replications, of different partition strategy, by number of partitions
n_groups = 3

# means_men = (20, 35, 30, 35, 27)
# std_men = (2, 3, 4, 1, 2)

means_HybridCut = (3.789756, 3.992878, 4.263219)
means_EdgePartition2D = (4.976609, 5.607006, 6.770593)
means_EdgePartition1DDst = (7.125874, 7.798577, 8.440782)
means_RandomVertexCut = (7.953123, 8.963526, 10.109881)
means_CanonicalRandomVertexCut = (7.95308, 8.965461, 10.108498)

fig, ax = plt.subplots()

index = np.arange(n_groups)
bar_width = 0.1

opacity = 0.4
error_config = {'ecolor': '0.3'}

# rects1 = plt.bar(index, means_men, bar_width,
#                  alpha=opacity,
#                  color='b',
#                  yerr=std_men,
#                  error_kw=error_config,
#                  label='Men')

rects1 = plt.bar(index, means_RandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='RandomVertexCut')

rects2 = plt.bar(index + bar_width, means_CanonicalRandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='CanonicalRandomVertexCut')

rects3 = plt.bar(index + 2 * bar_width, means_EdgePartition1DDst, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition1D')

rects4 = plt.bar(index + 3 * bar_width, means_EdgePartition2D, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition2D')

rects5 = plt.bar(index + 4 * bar_width, means_HybridCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='HybridCut')

plt.xlabel('# of Partitions')
plt.ylabel('Replication Factor')
plt.title('Replication Factor by # of Partitions (in-2.0-1m V1000000 E8179662)')
plt.xticks(index + 2 * bar_width, ('16', '25', '48'))
plt.legend(loc="upper left", ncol=2)

plt.tight_layout()
# plt.show()
plt.savefig('1.png')

# ingress time, of different partition strategy, by number of partitions
n_groups = 3

# means_men = (20, 35, 30, 35, 27)
# std_men = (2, 3, 4, 1, 2)

means_HybridCut = (105, 104, 102)
means_EdgePartition2D = (24, 23, 23)
means_EdgePartition1DDst = (22, 23, 23)
means_RandomVertexCut = (23, 23, 23)
means_CanonicalRandomVertexCut = (23, 23, 22)

fig, ax = plt.subplots()

index = np.arange(n_groups)
bar_width = 0.1

opacity = 0.4
error_config = {'ecolor': '0.3'}

# rects1 = plt.bar(index, means_men, bar_width,
#                  alpha=opacity,
#                  color='b',
#                  yerr=std_men,
#                  error_kw=error_config,
#                  label='Men')

rects1 = plt.bar(index, means_RandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='RandomVertexCut')

rects2 = plt.bar(index + bar_width, means_CanonicalRandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='CanonicalRandomVertexCut')

rects3 = plt.bar(index + 2 * bar_width, means_EdgePartition1DDst, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition1D')

rects4 = plt.bar(index + 3 * bar_width, means_EdgePartition2D, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition2D')

rects5 = plt.bar(index + 4 * bar_width, means_HybridCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='HybridCut')

plt.xlabel('# of Partitions')
plt.ylabel('Ingress Time (ms)')
plt.title('Replication Factor by # of Partitions (in-2.0-1m V1000000 E8179662)')
plt.xticks(index + 2 * bar_width, ('16', '25', '48'))
plt.legend(loc="upper left", ncol=2)

plt.tight_layout()
# plt.show()
plt.savefig('2.png')

# stddev of each parition's load of edges / vertices
n_groups = 3

# means_men = (20, 35, 30, 35, 27)
# std_men = (2, 3, 4, 1, 2)

means_HybridCut = (1166.5307272, 1262.69889744, 896.914117178)
means_EdgePartition2D = (43705.432858, 25163.2584429, 16175.1381428)
means_EdgePartition1DDst = (66531.0864313, 70052.7796267, 53850.2421565)
means_RandomVertexCut = (401.371277427, 560.645947457, 477.444935288)
means_CanonicalRandomVertexCut = (521.414182776, 557.853893417, 452.356881526)

fig, ax = plt.subplots()

index = np.arange(n_groups)
bar_width = 0.1

opacity = 0.4
error_config = {'ecolor': '0.3'}

# rects1 = plt.bar(index, means_men, bar_width,
#                  alpha=opacity,
#                  color='b',
#                  yerr=std_men,
#                  error_kw=error_config,
#                  label='Men')

rects1 = plt.bar(index, means_RandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='RandomVertexCut')

rects2 = plt.bar(index + bar_width, means_CanonicalRandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='CanonicalRandomVertexCut')

rects3 = plt.bar(index + 2 * bar_width, means_EdgePartition1DDst, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition1D')

rects4 = plt.bar(index + 3 * bar_width, means_EdgePartition2D, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition2D')

rects5 = plt.bar(index + 4 * bar_width, means_HybridCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='HybridCut')

plt.xlabel('# of Partitions')
plt.ylabel('stdev of vertices')
plt.title('stdev of vertices by # of Partitions (in-2.0-1m V1000000 E8179662)')
plt.xticks(index + 2 * bar_width, ('16', '25', '48'))
plt.legend(loc="upper left", ncol=2)

plt.tight_layout()
# plt.show()
plt.savefig('3.png')

n_groups = 3

# means_men = (20, 35, 30, 35, 27)
# std_men = (2, 3, 4, 1, 2)

means_HybridCut = (1519.62412602, 1497.14608826, 971.900964283)
means_EdgePartition2D = (40658.8290594, 57164.4456851, 29135.9185518)
means_EdgePartition1DDst = (114540.481712, 92676.6116675, 61614.1471869)
means_RandomVertexCut = (660.239528031, 631.597537677, 431.044643135)
means_CanonicalRandomVertexCut = (703.616628126, 632.364079941, 411.01016943)

fig, ax = plt.subplots()

index = np.arange(n_groups)
bar_width = 0.1

opacity = 0.4
error_config = {'ecolor': '0.3'}

# rects1 = plt.bar(index, means_men, bar_width,
#                  alpha=opacity,
#                  color='b',
#                  yerr=std_men,
#                  error_kw=error_config,
#                  label='Men')

rects1 = plt.bar(index, means_RandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='RandomVertexCut')

rects2 = plt.bar(index + bar_width, means_CanonicalRandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='CanonicalRandomVertexCut')

rects3 = plt.bar(index + 2 * bar_width, means_EdgePartition1DDst, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition1D')

rects4 = plt.bar(index + 3 * bar_width, means_EdgePartition2D, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition2D')

rects5 = plt.bar(index + 4 * bar_width, means_HybridCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='HybridCut')

plt.xlabel('# of Partitions')
plt.ylabel('stdev of edges')
plt.title('stdev of edges by # of Partitions (in-2.0-1m V1000000 E8179662)')
plt.xticks(index + 2 * bar_width, ('16', '25', '48'))
plt.legend(loc="upper left", ncol=2)

plt.tight_layout()
# plt.show()
plt.savefig('4.png')

# (max-min)/avg of each parition's load of edges / vertices
n_groups = 3

# means_men = (20, 35, 30, 35, 27)
# std_men = (2, 3, 4, 1, 2)

means_HybridCut = (0.01747025402, 0.02785584734, 0.04339256323)
means_EdgePartition2D = (0.3760761595, 0.3714460088, 0.7986372833)
means_EdgePartition1DDst = (0.5579980786, 0.9952969625, 1.761834863)
means_RandomVertexCut = (0.004635185362, 0.006091352889, 0.009766287061)
means_CanonicalRandomVertexCut = (0.003021706064, 0.006622637698, 0.00986734132)

fig, ax = plt.subplots()

index = np.arange(n_groups)
bar_width = 0.1

opacity = 0.4
error_config = {'ecolor': '0.3'}

# rects1 = plt.bar(index, means_men, bar_width,
#                  alpha=opacity,
#                  color='b',
#                  yerr=std_men,
#                  error_kw=error_config,
#                  label='Men')

rects1 = plt.bar(index, means_RandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='RandomVertexCut')

rects2 = plt.bar(index + bar_width, means_CanonicalRandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='CanonicalRandomVertexCut')

rects3 = plt.bar(index + 2 * bar_width, means_EdgePartition1DDst, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition1D')

rects4 = plt.bar(index + 3 * bar_width, means_EdgePartition2D, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition2D')

rects5 = plt.bar(index + 4 * bar_width, means_HybridCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='HybridCut')

plt.xlabel('# of Partitions')
plt.ylabel('(max-min)/avg of vertices')
plt.title('(max-min)/avg of vertices by # of Partitions (in-2.0-1m V1000000 E8179662)')
plt.xticks(index + 2 * bar_width, ('16', '25', '48'))
plt.legend(loc="upper left", ncol=2)

plt.tight_layout()
# plt.show()
plt.savefig('5.png')

n_groups = 3

# means_men = (20, 35, 30, 35, 27)
# std_men = (2, 3, 4, 1, 2)

means_HybridCut = (0.009686463817, 0.01682221099, 0.02481667335)
means_EdgePartition2D = (0.2247995088, 0.4710402459, 0.9330693615)
means_EdgePartition1DDst = (0.8824658036, 1.237040724, 2.059367245)
means_RandomVertexCut = (0.004833451553, 0.007659240687, 0.009993566971)
means_CanonicalRandomVertexCut = (0.005113169713, 0.00803211673, 0.00884926541)

fig, ax = plt.subplots()

index = np.arange(n_groups)
bar_width = 0.1

opacity = 0.4
error_config = {'ecolor': '0.3'}

# rects1 = plt.bar(index, means_men, bar_width,
#                  alpha=opacity,
#                  color='b',
#                  yerr=std_men,
#                  error_kw=error_config,
#                  label='Men')

rects1 = plt.bar(index, means_RandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='RandomVertexCut')

rects2 = plt.bar(index + bar_width, means_CanonicalRandomVertexCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='CanonicalRandomVertexCut')

rects3 = plt.bar(index + 2 * bar_width, means_EdgePartition1DDst, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition1D')

rects4 = plt.bar(index + 3 * bar_width, means_EdgePartition2D, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='EdgePartition2D')

rects5 = plt.bar(index + 4 * bar_width, means_HybridCut, bar_width,
                 alpha=opacity,
                 error_kw=error_config,
                 label='HybridCut')

plt.xlabel('# of Partitions')
plt.ylabel('(max-min)/avg of edges')
plt.title('(max-min)/avg of edges by # of Partitions (in-2.0-1m V1000000 E8179662)')
plt.xticks(index + 2 * bar_width, ('16', '25', '48'))
plt.legend(loc="upper left", ncol=2)

plt.tight_layout()
# plt.show()
plt.savefig('6.png')
