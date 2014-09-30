import sys
import urllib2

for line in sys.stdin:
	if "SparkDeploySchedulerBackend: Connected to Spark cluster with app ID" in line:
		# get correct ID, and omit newline \n
		appID = line.split('ID ')[1][:-1]
		url = 'http://brick0:8080/history/' + appID + '/executors/'
		response = urllib2.urlopen(url)
		html = response.read()
		import re
		matchObj = re.findall(r'<td sorttable_customkey="(.*?)">', html)
		# shuffle read
		print str(sum(map(int,matchObj[4::6])))
		# shuffle write
		print str(sum(map(int,matchObj[5::6])))
