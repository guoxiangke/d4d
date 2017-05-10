#!  /bin/bash 
#author : dale.tel@139.com
# require: docker-compose installed

# #install docker-compse
# docker-compose-version= "1.13.0";
# docker-compose-sh-url= "https://github.com/docker/compose/releases/download/${docker-compose-version}/run.sh"
# sudo curl -L "${docker-compose-sh-url}" > /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

#build & start  drupal !!!
composeFile=$1
projectName="d4d_${composeFile}"
docker-compose -p "${projectName} " -f "docker-compose-${composeFile}.yml " up -d 