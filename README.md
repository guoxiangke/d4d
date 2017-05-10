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

```seq
Title: Compose service Struture of d4d
Drupal iamge-->WebStorage:  (Build with && with CMD [])
Drupal iamge-->WebSerice: Build with
WebStorage->WebSerice: --volumes-from
```
```seq
Mysql iamge-->DBStorage:  -v (only expose volumes)
Mysql iamge-->DBSerice: Build
DBStorage->DBSerice: --volumes-from
```

```seq
DBSerice->WebSerice: --link
```
