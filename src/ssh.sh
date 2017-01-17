#echo $@
ssh -A -i /home/logan/.ssh/CLC-Admin.pem ubuntu@52.37.26.12 ssh -A  ubuntu@10.8.11.222 "/bin/bash /data/devops/scripts/$@"
