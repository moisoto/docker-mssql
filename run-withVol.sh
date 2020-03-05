#Image Namespace Info
imagename=sqlserver
tag=2019-latest

show_sintax () {
    echo
    echo 'Sintax:'
    echo "$0 container_name volume_name 'sa_password' [port]"
    echo 
    echo "*********************************************************************"
    echo "*** NOTE: The password MUST be specified inside single quotes (') ***"
    echo "*********************************************************************"
    echo
    echo "Current Containers:"
    docker container ls -af publish=1433 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
    exit 1
}

#Parent Dir Should be Docker Hub User Name
parentdir=$(cd .. && pwd)
username=$(basename $parentdir)
fullimagename="$username/$imagename:$tag"

[[ $# -lt 3 ]] && show_sintax

CONTAINER_NAME=$1
VOLUME_NAME=$2
SA_PWD=$3

if [[ $# -gt 3 ]] ; then
    re='^[0-9]+$'
    if ! [[ $4 =~ $re ]] ; then
        echo "Port Must Be a Number!"
        show_sintax
        exit 2
    fi
    PORT=$4
else
    PORT=1433
    echo "Port Not Specified, using $PORT"
fi

echo $CONTAINER_NAME:$3 >> PASSWORDS.sav
docker run -e 'ACCEPT_EULA=Y' -e "SA_PASSWORD=$SA_PWD" -p $PORT:1433 -v $VOLUME_NAME:/usr/mssql/data --name $CONTAINER_NAME -h $CONTAINER_NAME -d $fullimagename 
exit 0
