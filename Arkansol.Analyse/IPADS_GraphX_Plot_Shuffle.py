#! /usr/bin/env python
#################################################################################
#     File Name           :     IPADS_GraphX_Plot_Shuffle.py
#     Created By          :     xd
#     Creation Date       :     [2014-08-14 21:12]
#     Last Modified       :     [2014-08-14 22:09]
#     Description         :     report on the shuffle (cross executor communication)
#################################################################################

#!/usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt

N = 3
# partition
partition = [340400244, 333502667, 222239123, 244820041, 259525698, 255664500, 361246936, 357519858, 238320000, 258216451, 278573962, 280966093, 361764493, 360257019, 249256047, 259805173, 288140314, 288141909]
# execution
execution = [880857006, 795795372, 942038390, 1444367668, 1575656386, 1581155335, 937547349, 866032921, 1048610600, 1552889437, 1751384300, 1749533720, 1014937184, 972140679, 1278409479, 1670842576, 1952079232, 1951972584]

# convert unit
partition = map(lambda x: x/1024.0/1024/1024, partition)
execution = map(lambda x: x/1024.0/1024/1024, execution)

ind = np.arange(N)    # the x locations for the groups
width = 0.1      # the width of the bars: can also be len(x) sequence

labelPartition = ["Partition"]
labelExecution = ["Execution"]

for i in range(0, 6):
    if i<len(labelExecution):
        plt.bar(ind+i*width, execution[i::6], width, color='b', bottom=partition[i::6], label=labelExecution[i])
    else:
        plt.bar(ind+i*width, execution[i::6], width, color='b', bottom=partition[i::6])
    if i<len(labelPartition):
        plt.bar(ind+i*width, partition[i::6], width, color='r', label=labelPartition[i])
    else:
        plt.bar(ind+i*width, partition[i::6], width, color='r')


plt.ylabel('Network Shuffle (GB)')
plt.xlabel('Number of Partitions')
plt.title('Network Shuffle')
plt.text(0.1,2.0,'\nEach group from left to right:\nHybrid(100), Hybrid(30),\nEdge2D, Edge1D, Random, CanonicalRandom\n')
plt.xticks(ind + 2 * width, ('16', '25', '48'))
plt.legend()
plt.autoscale(tight=False)

#plt.show()
plt.savefig('7.png')
