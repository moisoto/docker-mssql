show_sintax () {
    echo
    echo 'Sintax:'
    echo "$0 container_name"
    echo 
    echo "Current Containers:"
    docker container ls -af publish=1433 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
    exit 1
}

[[ $# -lt 1 ]] && show_sintax

CONTAINER_NAME=$1
SA_PWD=$2

docker exec -it $CONTAINER_NAME /bin/bash
exit 0
