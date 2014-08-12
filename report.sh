# process partition and execution log
# grep "It\ took\|GRAPHX" *.txt | grep "INFO\|GRAPHX" | Arkansol.Maintanence/processLog.py

# process partition log
grep "It\ took\|GRAPHX" *.txt | grep "INFO\|GRAPHX" | Arkansol.Maintanence/processPartitionLog.py
ls *.txt
read -p "Move log to "$1" (Y or N)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$  ]]
then
	mv *.txt $1
fi
