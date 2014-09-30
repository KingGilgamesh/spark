#! /usr/bin/env python
#################################################################################
#     File Name           :     GetExecutorInfo.py
#     Created By          :     xiaodi
#     Creation Date       :     [2014-08-13 16:28]
#     Last Modified       :     [2014-08-13 16:50]
#     Description         :      
#################################################################################

import urllib2
url = 'http://brick0:8080/history/app-20140813154943-0014/executors/'
response = urllib2.urlopen(url)
html = response.read()
import re
matchObj = re.findall(r'<td sorttable_customkey="(.*?)">', html)
print matchObj[4::6]
print map(int,matchObj[4::6])
print sum(map(int,matchObj[4::6]))
print matchObj[5::6]

