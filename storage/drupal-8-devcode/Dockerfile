FROM drupal:latest

ENV DEV_GIT_USER guoxiangke
ENV DEV_GIT_REPO api
ENV DEV_GIT_BRANCH master
ENV DEV_GIT_URL https://github.com/${DEV_GIT_USER}/${DEV_GIT_REPO}/archive/${DEV_GIT_BRANCH}.zip
ENV DEV_GIT_DNAME "${DEV_GIT_REPO}-${DEV_GIT_BRANCH}"

#love site drupal code process
RUN set -ex \
	&& buildDeps=' \
		unzip \
	' \
	&& apt-get update && apt-get install -y --no-install-recommends $buildDeps && rm -rf /var/lib/apt/lists/* \
	&& curl -fSL "${DEV_GIT_URL}" -o tmp.zip \
	&& unzip -qq  tmp.zip \
	&& cp -R ./"${DEV_GIT_DNAME}"/modules .  \
	&& cp -R ./"${DEV_GIT_DNAME}"/themes .  \
	&& cp -R ./"${DEV_GIT_DNAME}"/profiles .  \
	&& rm ./"${DEV_GIT_DNAME}" -rf \
	&& chown -R www-data:www-data sites modules themes \
	&& apt-get purge -y --auto-remove $buildDeps

#default office drupal code process
RUN mkdir /var/www/html/sites/default/files  \
	&& chmod -R 777 /var/www/html/sites/default/files 
#VOLUME ["/var/www/html/profiles","var/www/html/modules","/var/www/html/themes","/var/www/html/sites/default"]
CMD []