# 欢迎使用 d4d (Docker4Drupal)

------

```bash
#Usage:
$ chmod +x ./d4d.sh
$ ./d4d.sh simple #build a simple one
$ ./d4d.sh multi  #build with haproxy
```

使用的镜像：

> * [drupal:latest](https://hub.docker.com/_/drupal/)
> * [mysql:latest](https://hub.docker.com/_/mysql/)
> * [haproxy:latest](https://hub.docker.com/_/haproxy/)


简单构建图：

![简单构建图](https://raw.githubusercontent.com/guoxiangke/d4d/master/struture.png)
```graphLR
    A{drupal:latest} -->|volumes && empty CMD| B[WebStorage:storage-drupal]
    A -->|Build | C(WebService:web)
    B -->| --volumes-from| C(WebService:web)
    
    D{mysql:latest} -->|volumes && empty CMD| E[DBStorage:storage-mysql]
    D -->|Build | F(DBService:db)
    E -->| --volumes-from| F(DBService:db)
    
    F -->|--link|C(WebService:web)
```



Drupal config:
	Database name :  drupal
	Database username :  drupal 
	Database password : drupal
	Database Host : dbhost
	Database Host Port : 3306


