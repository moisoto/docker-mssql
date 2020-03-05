show_sintax () {
    echo
    echo 'Sintax:'
    echo "$0 [stop|start] container_name"
    echo
    echo "Current Containers:"
    docker container ls -af publish=1433 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}" 
    exit 1
}

[[ $# -lt 2 ]] && show_sintax 

containername=$2

if [[ $1 = 'start' ]] ; then
    echo "Starting $containername..."
    docker start $containername 
    docker container ls -f name=^/${containername}$
    exit 0
fi


if [[ $1 = 'stop' ]] ; then
    echo "Stopping $containername..."
    docker stop $containername 
    exit 0
fi

show_sintax
