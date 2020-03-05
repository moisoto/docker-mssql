if [[ $# -lt 2 ]] ; then
    echo
    echo 'Sintax:'
    echo "$0 container_name 'sa_password'"
    echo 
    echo "*********************************************************************"
    echo "*** NOTE: The password MUST be specified inside single quotes (') ***"
    echo "*********************************************************************"
    echo
    echo "Current Containers:"
    docker container ls -af publish=1433 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
    exit 1
fi

CONTAINER_NAME=$1
SA_PWD=$2

docker exec -it $CONTAINER_NAME /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PWD"
exit 0
