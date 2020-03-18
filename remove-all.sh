#Image Namespace Info
imagename=sqlserver
tag=2019-latest

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

#Parent Dir Should be Docker Hub User Name
parentdir=$(cd .. && pwd)
username=$(basename $parentdir)
fullimagename="$username/$imagename:$tag"
containername=$1

echo "Container $containername will be stopped and removed!"
printf "Do you wish to continue (Y/n)?"
read REPLY
[[ $REPLY == "y" ]] && echo "Please use Capital Y if you wish to continue"
if [[ $REPLY != "Y" ]] ; then
    echo "Script Cancelled!"
    exit
fi
echo "Stopping $containername..."
docker container stop $containername
docker container rm $containername

echo
echo "Image $fullimagename will be removed!"
printf "Do you wish to continue (Y/n)?"
read REPLY
[[ $REPLY == "y" ]] && echo "Please use Capital Y if you wish to continue"
if [[ $REPLY != "Y" ]] ; then
    echo "Script Cancelled!"
    exit
fi
docker image rm $fullimagename
