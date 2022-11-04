#! /bin/bash

while getopts r:u:p:i:t: flag
do
    case "${flag}" in
        r) REGISTRY=${OPTARG};;
        u) REGISTRY_USERNAME=${OPTARG};;
        p) REGISTRY_PASSWORD=${OPTARG};;
        i) IMAGE=${OPTARG};;
        t) TAG=${OPTARG};;
    esac
done

docker login -u "$REGISTRY_USERNAME" -p "$REGISTRY_PASSWORD" $REGISTRY

docker build -t $REGISTRY:$TAG -f docker/Dockerfile .
docker tag $IMAGE:$TAG $REGISTRY/$IMAGE:$TAG
docker push $REGISTRY$IMAGE:$TAG

envsubst < docker/docker-compose.yml > docker-compose.yml
