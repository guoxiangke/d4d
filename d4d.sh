#!  /bin/bash 
#author : dale.tel@139.com
# require: docker-compose installed
# trap 'echo “before execute line:$LINENO, composeFile=$composeFile,projectName”=$projectName,compose_yml=$compose_yml”' DEBUG

file="/usr/local/bin/docker-compose"
if [ -f $file ]
then
	##build & start  drupal !!!
	composeFile=$1
	if [ composeFile ] 
	then
		projectName="d4d_${composeFile}"
		compose_yml="./docker-compose-${composeFile}.yml"
		if [ -f $compose_yml ]
		then
			docker-compose -p ${projectName}  -f ${compose_yml} up -d 
			# --force-rm 删除构建过程中的临时容器。
			# --no-cache 构建镜像过程中不使用 cache（这将加长构建过程）。
			# --pull 始终尝试通过 pull 来获取更新版本的镜像。
			#默认情况，如果服务容器已经存在，docker-compose up 将会尝试停止容器，然后重新创建（保持使用 volumes-from 挂载的卷），
			# 以保证新启动的服务匹配 docker-compose.yml 文件的最新内容。如果用户不希望容器被停止并重新创建，
			# 可以使用 docker-compose up --no-recreate。这样将只会启动处于停止状态的容器，而忽略已经运行的服务。
			# 如果用户只想重新部署某个服务，可以使用 docker-compose up --no-deps -d <SERVICE_NAME> 
			# 来重新创建服务并后台停止旧服务，启动新服务，并不会影响到其所依赖的服务。
			echo "sudo docker-compose --pull --force-rm -p ${projectName}  -f ${compose_yml}  up -d "
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

