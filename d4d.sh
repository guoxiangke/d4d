#!  /bin/bash 
#author : dale.tel@139.com
# require: docker-compose installed
trap 'echo “before execute line:$LINENO, composeFile=$composeFile,projectName”=$projectName,compose_yml=$compose_yml”' DEBUG

file="/usr/local/bin/docker-compose"
if [ -f $file ]
then
	##build & start  drupal !!!
	composeFile=$1
	if [ composeFile ] 
	then
		if [ $composeFile = "simple" ] 
		then
			projectName="d4d_${composeFile}"
			compose_yml="./docker-compose-${composeFile}.yml"
			# compose_yml="./docker-compose-simple.yml"
		else
			projectName="d4d_haproxy"
			compose_yml="./docker-compose-haproxy.yml"
		fi
		if [ -f $compose_yml ]
		then
			docker-compose -p ${projectName}  -f ${compose_yml} up -d 
			echo "If not build plz execute blow cmd\r\n"
			echo "sudo docker-compose -p ${projectName}  -f ${compose_yml}  up -d "
		else
			echo "Error: No ${compose_yml} !"
		fi
	else
		echo "Error: Wrong pargrams!"
	fi
else
	# #install docker-compse
	docker_compose_version="1.13.0";
	docker_compose_sh_url="https://github.com/docker/compose/releases/download/${docker_compose_version}/run.sh"
	echo "Begin download from: \r ${docker_compose_sh_url}"
	curl -L "${docker_compose_sh_url}" > /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
fi

