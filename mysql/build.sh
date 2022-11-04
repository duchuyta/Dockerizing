#! /bin/bash
docker build -t mysql:5.7.40 .

docker login <registry>
docker tag mysql:5.7.40 <registry/mysql:5.7.40>
docker push <registry/mysql:5.7.40>
