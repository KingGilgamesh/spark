#! /usr/bin/env python
#################################################################################
#     File Name           :     IPADS_GraphX_Plot_Partition_2.py
#     Created By          :     xd
#     Creation Date       :     [2014-08-14 22:09]
#     Last Modified       :     [2014-08-14 22:11]
#     Description         :     new partition plot to concern only about data
#################################################################################
  
#!/usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cm as cm

def IPADS_GraphX_Plot(
    data, ngroup, label, filename, xlabel, ylabel, title, xticks, legendPos, legendNcol
    ):
    plt.clf() # Clear figure
    N = ngroup
    step = len(data) / N
    ind = np.arange(N)    # the x locations for the groups
    width = 0.1      # the width of the bars: can also be len(x) sequence

    for i in range(0, step):
        if i<len(label):
            plt.bar(ind+i*width, data[i::step], width, color=cm.Paired(1.0/(i+1)), label=label[i])
        else:
            plt.bar(ind+i*width, data[i::step], width, color=cm.Paired(1.0/(i+1)))

    plt.ylabel(ylabel)
    plt.xlabel(xlabel)
    plt.title(title)
    plt.xticks(ind + 2 * width, xticks)
    plt.legend(loc=legendPos, ncol=legendNcol)

    # plt.show()
    plt.savefig(filename)


filename = "9.png"
data = [146559,
             101280,
             93529,
             139790,
             132659,
             139120,
             108985,
             133896,
             154567,
             153680,
             182312,
             232833,
             192383,
             194857,
             280573,
             417558,
             361235,
             308501]
label = ["Hybrid(100)", "Hybrid(30)", "Edge2D", "Edge1D", "Random", "CanonicalRandom"]
xlabel = 'Execution Time (second)'
ylabel = 'Number of Partitions'
title = 'Execution Time (in-2.0-1m V1000000 E8179662)'
xticks = ('16', '25', '48')
legendPos = "upper left"
legendNcol = 2
ngroup = 3
# convert unit
data = map(lambda x: x/1000.0, data)

IPADS_GraphX_Plot(
    data = data,
    ngroup = ngroup,
    label = label,
    filename = filename,
    xlabel = xlabel,
    ylabel = ylabel,
    title = title,
    xticks = xticks,
    legendPos = legendPos,
    legendNcol = legendNcol,
    )

filename = "10.png"
data = [4.21914028911,
             3.7368692711,
             4.85803910642,
             3.75580013086,
             6.10288873181,
             5.54774338168,
             4.645440915,
             4.17718818837,
             4.31699997602,
             5.38391002532,
             7.15146857475,
             6.36269531228,
             5.12988273555,
             4.75113421863,
             5.18381478864,
             5.9121127584,
             8.46766006671,
             7.35200459511]
label = ["Hybrid(100)", "Hybrid(30)", "Edge2D", "Edge1D", "Random", "CanonicalRandom"]
xlabel = '# of Partitions'
ylabel = 'Replication Factor'
title = 'Replication Factor by # of Partitions (web-google-single V875713 E5105039)'
xticks = ('16', '25', '48')
legendPos = "upper left"
legendNcol = 3
ngroup = 3
IPADS_GraphX_Plot(
    data = data,
    ngroup = ngroup,
    label = label,
    filename = filename,
    xlabel = xlabel,
    ylabel = ylabel,
    title = title,
    xticks = xticks,
    legendPos = legendPos,
    legendNcol = legendNcol,
    )

filename = "11.png"
data = [103, 105, 23, 23, 23, 22, 104, 105, 22, 21, 22, 22, 103, 103, 23, 22, 23, 22]
label = ["Hybrid(100)", "Hybrid(30)", "Edge2D", "Edge1D", "Random", "CanonicalRandom"]
xlabel = '# of Partitions'
ylabel = 'Ingress Time (ms)'
title = 'Ingress Time by # of Partitions (web-google-single V875713 E5105039)'
xticks = ('16', '25', '48')
legendPos = "upper left"
legendNcol = 3
ngroup = 3
IPADS_GraphX_Plot(
    data = data,
    ngroup = ngroup,
    label = label,
    filename = filename,
    xlabel = xlabel,
    ylabel = ylabel,
    title = title,
    xticks = xticks,
    legendPos = legendPos,
    legendNcol = legendNcol,
    )



xlabel = '# of Partitions'
ylabel = 'stdev of vertices'
title = 'stdev of vertices by # of Partitions (web-google-single V875713 E5105039)'
filename = "12.png"
data = [1488.6714085, 753.544123521, 4227.30253826, 30134.8904464, 512.89786005, 642.786800653, 1243.13596746, 728.884052233, 19262.1185923, 5564.88385503, 436.401272225, 475.143767717, 1009.6037415, 573.291372919, 10666.0414354, 3999.63980127, 458.58901959, 422.537800331]
label = ["Hybrid(100)", "Hybrid(30)", "Edge2D", "Edge1D", "Random", "CanonicalRandom"]
xticks = ('16', '25', '48')
legendPos = "upper left"
legendNcol = 3
ngroup = 3
IPADS_GraphX_Plot(
    data = data,
    ngroup = ngroup,
    label = label,
    filename = filename,
    xlabel = xlabel,
    ylabel = ylabel,
    title = title,
    xticks = xticks,
    legendPos = legendPos,
    legendNcol = legendNcol,
    )

xlabel = '# of Partitions'
ylabel = 'stdev of edges'
title = 'stdev of edges by # of Partitions (web-google-single V875713 E5105039)'
filename = "13.png"
data = [2325.52199701, 1320.9993598, 7603.45404626, 2690.44774314, 607.542536448, 883.859326247, 1811.85158509, 1414.91908122, 3366.48905633, 7993.1149977, 484.047194393, 511.027285377, 1335.58608373, 828.842050936, 15417.097578, 4812.01482182, 350.905108825, 377.629861195]
label = ["Hybrid(100)", "Hybrid(30)", "Edge2D", "Edge1D", "Random", "CanonicalRandom"]
xticks = ('16', '25', '48')
legendPos = "upper left"
legendNcol = 3
ngroup = 3
IPADS_GraphX_Plot(
    data = data,
    ngroup = ngroup,
    label = label,
    filename = filename,
    xlabel = xlabel,
    ylabel = ylabel,
    title = title,
    xticks = xticks,
    legendPos = legendPos,
    legendNcol = legendNcol,
    )

# xlabel = '# of Partitions'
# ylabel = '(max-min)/avg of vertices'
# title = '(max-min)/avg of vertices by # of Partitions (web-google-single V875713 E5105039)'
# 
# xlabel = '# of Partitions'
# ylabel = '(max-min)/avg of edges'
# title = '(max-min)/avg of edges by # of Partitions (web-google-single V875713 E5105039)'
# 

xlabel = '# of Partitions'
ylabel = 'Replication Factor'
title = 'Replication Factor by # of Partitions (soc-LiveJournal1 V4847571 E68993773)'
xlabel = '# of Partitions'
ylabel = 'stdev of vertices'
title = 'stdev of vertices by # of Partitions (soc-LiveJournal1 V4847571 E68993773)'
xlabel = '# of Partitions'
ylabel = 'stdev of edges'
title = 'stdev of edges by # of Partitions (soc-LiveJournal1 V4847571 E68993773)'

xlabel = '# of Partitions'
ylabel = 'Replication Factor'
title = 'Replication Factor by # of Partitions (soc-LiveJournal1 V4847571 E68993773)'
filename = "14.png"
data = [5.83256150348, 5.00636483715, 4.45356055641, 6.24904844096, 7.71010450388, 6.37401659512, 6.98455246968, 6.06394728411, 5.29022081368, 7.61019549791, 9.8903190897, 7.86495092078, 8.60331885804, 7.72158282983, 6.72133033224, 9.57859781734, 13.4800690903, 10.1176783177]
label = ["Hybrid(100)", "Hybrid(30)", "Edge2D", "Edge1D", "Random", "CanonicalRandom"]
xticks = ('16', '25', '48')
legendPos = "upper left"
legendNcol = 3
ngroup = 3
IPADS_GraphX_Plot(
    data = data,
    ngroup = ngroup,
    label = label,
    filename = filename,
    xlabel = xlabel,
    ylabel = ylabel,
    title = title,
    xticks = xticks,
    legendPos = legendPos,
    legendNcol = legendNcol,
    )

xlabel = '# of Partitions'
ylabel = 'stdev of vertices'
title = 'stdev of vertices by # of Partitions (soc-LiveJournal1 V4847571 E68993773)'
filename = "15.png"
data = [1811.74003033, 1081.50691854, 290124.794151, 2445.98116497, 736.076632283, 731.045901004, 1711.13733125, 1208.98552514, 197679.735597, 3380.31018837, 924.754561167, 1134.14999784, 2296.44804677, 1286.57201168, 96026.7101455, 4257.20150275, 809.257504342, 778.212022131]
label = ["Hybrid(100)", "Hybrid(30)", "Edge2D", "Edge1D", "Random", "CanonicalRandom"]
xticks = ('16', '25', '48')
legendPos = "upper left"
legendNcol = 3
ngroup = 3
IPADS_GraphX_Plot(
    data = data,
    ngroup = ngroup,
    label = label,
    filename = filename,
    xlabel = xlabel,
    ylabel = ylabel,
    title = title,
    xticks = xticks,
    legendPos = legendPos,
    legendNcol = legendNcol,
    )

xlabel = '# of Partitions'
ylabel = 'stdev of edges'
title = 'stdev of edges by # of Partitions (soc-LiveJournal1 V4847571 E68993773)'
filename = "16.png"

data = [9023.28625847,
9919.2555556,
19606.060674,
15191.7761438,
2424.12069674,
3144.04383754,
8524.25111277,
9485.00318575,
16107.8162292,
16489.4759357,
1886.11609229,
2797.04864341,
6773.90225036,
6602.12176671,
209703.384542,
12262.679599,
1090.59982998,
1621.1235011]
label = ["Hybrid(100)", "Hybrid(30)", "Edge2D", "Edge1D", "Random", "CanonicalRandom"]
xticks = ('16', '25', '48')
legendPos = "upper left"
legendNcol = 3
ngroup = 3
IPADS_GraphX_Plot(
    data = data,
    ngroup = ngroup,
    label = label,
    filename = filename,
    xlabel = xlabel,
    ylabel = ylabel,
    title = title,
    xticks = xticks,
    legendPos = legendPos,
    legendNcol = legendNcol,
    )


