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
- run db migrations for sample CRUD app
```shell
docker exec -it php /app/artisan migrate
```

- open http://localhost/posts for visit Laravel sample CRUD site in browser

- Import sample database (testdb) and test
```shell
docker exec -it mysql /tmp/testdb_init.sh
```

- execute mysql backup script
```shell
docker exec -it mysql /opt/mysql_backup.sh
ls -al /opt/mysql_backup
```
