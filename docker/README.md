# How to build docker images

## Clean the project 
```
gradle clean 

```

## Create Release
```
gradle createRelease 

```

## Build With Apache Tomcat 
```
docker build -t adempiere-zk-tomcat -f docker/tomcat/tomcat.Dockerfile .
```

## Build With Jetty 
```
docker build -t adempiere-zk-jetty -f docker/jetty/jetty.Dockerfile .
```

## Run a Container with apache tomcat
```
docker run -d -e "ADEMPIERE_DB_SERVER=database-server" -e "ADEMPIERE_DB_PORT=5432" adempiere-zk-tomcat
```

## Run a Container with Jetty
```
docker run -d -e "ADEMPIERE_DB_SERVER=database-server" -e "ADEMPIERE_DB_PORT=5432" adempiere-zk-jetty
```
## Run docker compose
```
cd docker/compose
```
##Run Docker Compose
```
docker compose up -d
```
## Environment variables
- `ADEMPIERE_DB_TYPE`: Database Type (Supported Oracle, PostgreSQL and MariaDB). Default **PostgreSQL**
- `ADEMPIERE_DB_SERVER`: Hostname for PostgreSQL server. Default: **localhost**
- `ADEMPIERE_DB_PORT`: Port used by PostgreSQL server. Default: **5432**
- `ADEMPIERE_DB_NAME`: Database name that Adempiere will use to connect with the database. Default: **adempiere**
- `ADEMPIERE_DB_USER`: Database user that Adempiere will use to connect with the database. Default: **adempiere**
- `ADEMPIERE_DB_PASSWORD`: Database password that Adempiere will use to connect with the database. Default: **adempiere**
- `ADEMPIERE_JAVA_OPTIONS`:  Additional java options to execute application. Default: **-Xms128m -Xmx1024m**
- `ADEMPIERE_HOME`:  Directory of application. Default: **/opt/Adempiere** 
