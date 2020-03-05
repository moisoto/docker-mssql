show_sintax () {
    echo
    echo 'Sintax:'
    echo "$0 container_name 'sa_password' [port]"
    echo 
    echo "*********************************************************************"
    echo "*** NOTE: The password MUST be specified inside single quotes (') ***"
    echo "*********************************************************************"
    echo
    echo "Current Containers:"
    docker container ls -af publish=1433 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
    exit 1
}

[[ $# -lt 2 ]] && show_sintax

CONTAINER_NAME=$1
#SA_PWD=\'SA_PASSWORD=$2\'
SA_PWD=$2

if [[ $# -gt 2 ]] ; then
    re='^[0-9]+$'
    if ! [[ $3 =~ $re ]] ; then
        echo "Port Must Be a Number!"
        show_sintax
        exit 2
    fi
    PORT=$3
else
    PORT=1433
    echo "Port Not Specified, using $PORT"
fi

echo $CONTAINER_NAME:$2 >> PASSWORDS.sav
#docker run -e 'ACCEPT_EULA=Y' -e $SA_PWD -p $PORT:1433 --name $CONTAINER_NAME -h $CONTAINER_NAME -d mcr.microsoft.com/mssql/server:2019-latest
docker run -e 'ACCEPT_EULA=Y' -e "SA_PASSWORD=$SA_PWD" -p $PORT:1433 --name $CONTAINER_NAME -h $CONTAINER_NAME -d mcr.microsoft.com/mssql/server:2019-latest
exit 0
