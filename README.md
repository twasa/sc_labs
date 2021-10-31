# exercise demo
This is a exercise demo for running Nginx, PHP, MySQL with docker and docker-compose


## requirements
- docker
- docker-compose

## set up flow
- clone this repository with the following command:
```shell
git clone --recursive https://github.com/twasa/Smartclouds_exercise.git
```
- get into repository and create .env copy from .env.example

```shell
cd Smartclouds_exercise && cp .env.example .env
```

## run all services up

```shell
docker-compose up -d
```

## test
- open http://localhost/posts for visit Laravel sample CRUD site
- run /opt/mysql_backup.sh in mysql container for exec backup procedure
