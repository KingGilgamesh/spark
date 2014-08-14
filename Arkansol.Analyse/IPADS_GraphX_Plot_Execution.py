#! /usr/bin/env python
#################################################################################
#     File Name           :     IPADS_GraphX_Plot_Shuffle.py
#     Created By          :     xd
#     Creation Date       :     [2014-08-14 21:40]
#     Last Modified       :     [2014-08-14 22:09]
#     Description         :     report on the execution time
#################################################################################

#!/usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cm as cm

N = 3
executionTime = [146559, 101280, 93529, 139790, 132659, 139120, 108985, 133896, 154567, 153680, 182312, 232833, 192383, 194857, 280573, 417558, 361235, 308501]
# convert unit
executionTime = map(lambda x: x/1000.0, executionTime)

ind = np.arange(N)    # the x locations for the groups
width = 0.1      # the width of the bars: can also be len(x) sequence

labelExecution = ["Hybrid(100)", "Hybrid(30)", "Edge2D", "Edge1D", "Random", "CanonicalRandom"]

for i in range(0, 6):
    if i<len(labelExecution):
        plt.bar(ind+i*width, executionTime[i::6], width, color=cm.Paired(1.0/(i+1)), label=labelExecution[i])
    else:
        plt.bar(ind+i*width, executionTime[i::6], width, color=cm.Paired(1.0/(i+1)))


plt.ylabel('Execution Time (second)')
plt.xlabel('Number of Partitions')
plt.title('Execution Time (in-2.0-1m)')
plt.xticks(ind + 2 * width, ('16', '25', '48'))
plt.legend(loc="upper left", ncol=2)

plt.autoscale(tight=False)

#plt.show()
plt.savefig('8.png')

