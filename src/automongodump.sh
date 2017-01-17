HOSTLIST=10.9.21.11,10.9.22.11,10.9.23.11
DATE=`date +%Y%m%d-%H%M`
ssh -A -i /home/logan/.ssh/CLC-Admin.pem ubuntu@52.37.26.12 ssh -A  ubuntu@10.8.11.222 "sudo mongodump --host \"$HOSTLIST\" --out /data/dump$DATE && sudo du -sh /data/dump$DATE"


