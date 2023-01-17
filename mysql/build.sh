#! /bin/bash
docker build -t mysql:8.0.31 .

docker login <registry>
docker tag mysql:8.0.31 <registry>/mysql:8.0.31
docker push <registry>/mysql:8.0.31
