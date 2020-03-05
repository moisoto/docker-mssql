# docker-mssql
 Docker SQL Server Image Build Template with Persistent DB Support

# Purpose
 This is a Dockerfile and a set of scripts showing how to make a docker image from SQL Server 2019 that creates and populates a DB. 
 
 Scripts are also provided for common tasks that are usually performed on a development environment.
 
### Clonning
 The provided scripts will create a properly namespaced image that includes the username in case you want to push the image into Docker Home. The username will match the foldername that contains the scripts. 
 
 Because that, its recommended that you clone this repository like this:
 ```
 mkdir -p ~/docker/repo/github.com/yourusername/
 cd ~/docker/repo/github.com/yourusername/
 git clone https://github.com/moisoto/docker-mssql.git
 ```
 
### Building the image
 Script **build-latest.sh** will create an image in the form of **yourusername/sqlserver:2019-latest**
 ```
 ./build-latest.sh
 
 ```
 
### Running a container
 
 The following scripts are provided showing how to run a container with the DB inside the union/layered filesystem or inside a volume.
  
 For temporal DBs you can use **run.sh** it will create the container with the DB inside the union/layered filesystem. This means that you will lose the database when removing the container. Stoping and Starting the container is safe as files on it are persistent.
 ```
 # Run the container on port 1433
 ./run.sh test_db 'aComplex!Pass4DB'
  
 # Run another container exposing container port 1433 on host port 41433
 ./run.sh dev_db otherComplex#Pass2 41433
 ```
  
 To Persist the DB on a volume, please use the folowing script:
 ```
 ./run-withVol.sh persistent_db mssql-vol '1Cool*Password' 21433
 ```
  
# Other Support Scripts
 Following is a list of scripts provided to show how to do some common tasks on the MS-SQL Server docker image

### Running a SQL Express Edition Container
```
./run-express.sh express_db Test#1234 31433
```

### Running a bash shell inside the container
 ```
 ./run-bash.sh test_db
 ```
 
### Running sqlcmd
 ```
 ./sqlcmd.sh test_db 'aComplex!Pass4DB'
 ```
 
### Stop/Start Container
 ```
 # Stopping Container
 ./mssql-ctl.sh stop test_db
 
 # Starting Container
 ./mssql-ctl.sh start test_db
 ```

### Pushing your image to docker hub.
 If the folder containing your cloned repo is named the same as your Docker Username, your instance is ready to be pushed to Docker Home. 
 
 Create a repository named sqlserver on Docker Home and then run the following command (replacing **yourusername** with your actual username):
 ```
 docker image push yourusername/sqlserver:2019-latest
 ```

### Removing Containers & Image
```
# Manually stop and erase container
docker container stop dev_db && docker container rm dev_db
docker container stop persistent_db && docker container rm persistent_db
docker container stop express_db && docker container rm express_db

# Remove the remaining container and the image (optionally)
./remove-all.sh test_db

# Optionally remove the volume previously created
docker volume rm mssql-vol
```
