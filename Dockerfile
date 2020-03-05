#Build Latest SQL Server 2019
FROM mcr.microsoft.com/mssql/server:2019-latest

#Ensure running with root
USER root

# Create app directory
RUN mkdir -p /usr/scripts && mkdir -p /usr/mssql/data
WORKDIR /usr/scripts/

# Bundle files
COPY Bundlefiles/* /usr/scripts/

# Grant permissions for the import-data script to be executable
RUN chmod 744 /usr/scripts/*.sh

CMD /bin/bash ./entrypoint.sh
