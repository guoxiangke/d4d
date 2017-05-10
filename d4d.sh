#!  /bin/bash 
#author : dale.tel@139.com
# require: docker-compose installed
trap 'echo “before execute line:$LINENO, composeFile=$composeFile,projectName”=$projectName”' DEBUG

file="/usr/local/bin/docker-compose"
if [ -f $file ]
then
	##build & start  drupal !!!
	composeFile=$1
	if [ composeFile ] 
	then
		if [ composeFile = "simple" ] 
		then
			projectName="d4d_${composeFile}"
		else
			projectName="d4d_haproxy"
		fi
		compose_yml="./docker-compose-${composeFile}.yml"
		if [ -f $compose_yml ]
		then
			docker-compose -p "${projectName} " -f compose_yml up -d 
		else
			echo "Error: No ${compose_yml}!"
		fi
	else
		echo "Error: Wrong pargrams!"
	fi
else
	# #install docker-compse
	docker_compose_version="1.13.0";
	docker_compose_sh_url="https://github.com/docker/compose/releases/download/${docker_compose_version}/run.sh"
	curl -L "${docker_compose_sh_url}" > /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
fi

