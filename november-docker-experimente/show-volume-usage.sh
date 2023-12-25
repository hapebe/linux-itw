#!/bin/bash
# from: https://stackoverflow.com/questions/42857575/how-to-determine-what-containers-use-the-docker-volume
for v in $(docker volume ls --format "{{.Name}}")
do
  # containers="$(docker ps -a --filter volume=$v | tr '\n' ',')"
  containers="$(docker ps -a --filter volume=$v --format '{{.Names}}' | tr '\n' ',')"
  echo "volume $v is used by $containers"
done
