if [[ $# -lt 1 ]] ; then
    echo 'Sintax:'
    echo "$0 container_name"
    echo 
    echo "Current Containers:"
    docker container ls -af publish=1433 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
    exit 1
fi

CONTAINER_NAME=$1

docker exec -it $CONTAINER_NAME /bin/bash
exit 0
