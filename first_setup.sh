#!/usr/bin/python3

docker pull nikolanna/bgjournal-api
docker pull nikolanna/bgjournal-ui

secret_key="$(openssl rand -base64 32)"
db_password="$(openssl rand -base64 16)"

docker-compose exec etcd etcdctl set /django "$secret_key"
docker-compose exec etcd etcdctl mkdir /db_data
docker-compose exec etcd etcdctl set /db_data/user "postgres"
docker-compose exec etcd etcdctl set /db_data/name "bgjournal"
docker-compose exec etcd etcdctl set /db_data/pswd db_password

docker-compose exec etcd etcdctl set /setup_completed 1


