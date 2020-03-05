#Image Namespace Info
imagename=sqlserver
tag=2019-latest

#Parent Dir Should be Docker Hub User Name
parentdir=$(cd .. && pwd)
username=$(basename $parentdir)
fullimagename="$username/$imagename:$tag"

echo "This will build $imagename image"
echo "Parent directory is being used as your Docker ID"
echo
echo "Image to Build: $fullimagename"
printf "Do you wish to continue (Y/n)?"
read REPLY
[[ $REPLY == "y" ]] && echo "Please use Capital Y if you wish to continue"
if [[ $REPLY != "Y" ]] ; then
    echo "Script Cancelled!"
    exit
fi

docker image build -t $fullimagename .
