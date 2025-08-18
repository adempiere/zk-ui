# zk-ui

<p align="center">
  <a href="https://adoptium.net/es/temurin/releases/?version=17">
    <img src="https://badgen.net/badge/Java/17/orange" alt="Java">
  </a>
  <a href="https://github.com/adempiere/zk-ui/actions/workflows/ci.yml">
    <img src="https://github.com/adempiere/zk-ui/actions/workflows/ci.yml/badge.svg" alt="Build GH Action">
  </a>
  <a href="https://github.com/adempiere/zk-ui/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/license-GNU/GPL%20(v2)-blue" alt="License">
  </a>
  <a href="https://github.com/adempiere/zk-ui/releases/latest">
    <img src="https://img.shields.io/github/release/adempiere/zk-ui.svg" alt="GitHub release">
  </a>
  <a href="https://discord.gg/T6eH6A7PJZ">
    <img src="https://badgen.net/badge/discord/join%20chat" alt="Discord">
  </a>
</p>

A swing User Interface based in adempiere box

This project just treat of run ADempiere ZK UI based on base adempiere box project using gradle

![ADempiere ZK](docs/ADempiere_ZK.gif)

## Requirements

This project is a java client using swing interface and completely based on gradle package management

The follow requirements need for run it:

- [Java 17 or higher](https://adoptopenjdk.net/)
- [Gradle 9](https://gradle.org/install/)

## Runing as development

### Clean
```shell
gradle clean
```

### Execute ZK-UI with jetty lugin
With default connection properties file (`$HOME/Adempiere.properties`)
```shell
gradle appRun
```

```shell
# As System Property
gradle appRun -DPropertyFile=/tmp/TEMPLATE.properties
```


## Generate war file

You can generate a war file using the follow command

```shell
# As System Property
gradle war
```

## Run with Docker Compose

You can also run it with `docker compose` for develop enviroment. Note that this is a easy way for start the service with PostgreSQL and middleware.

### Environment variables
 * `ADEMPIERE_HOME`: Directory where the application will be located. Default: `/opt/Adempiere`.
 * `ADEMPIERE_DB_TYPE`: Database Type (Supported `Oracle` and `PostgreSQL`). Default `PostgreSQL`.
 * `ADEMPIERE_DB_SERVER`: Hostname for data base server. Default: `localhost`.
 * `ADEMPIERE_DB_PORT`: Port used by data base server. Default: `5432`.
 * `ADEMPIERE_DB_NAME`: Database name that Adempiere-Zk UI will use to connect with the database. Default: `adempiere`.
 * `ADEMPIERE_DB_USER`: Database user that Adempiere-Zk UI will use to connect with the database. Default: `adempiere`.
 * `ADEMPIERE_DB_PASSWORD`: Database password that Adempiere-Zk UI will use to connect with the database. Default: `adempiere`. For added security, implement secrets with `ADEMPIERE_DB_PASSWORD_FILE`.
 * `ADEMPIERE_DB_PASSWORD_FILE`: Database password that Adempiere-Zk UI will use to connect with the database. This overrides `ADEMPIERE_DB_PASSWORD` but if not defined no secrets will be implemented in the password but instead the value of the environment variable will be used.
 * `ADEMPIERE_JAVA_OPTIONS`: Custom settings to the Java Virtual Machine (JVM). Default: `-Xms64M -Xmx1512M`.

### Requirements

- [Docker Compose v2.16.0 or later](https://docs.docker.com/compose/install/linux/)

```Shell
docker compose version
Docker Compose version v2.16.0
```

### Run it

Just go to `docker-compose` folder and run it

```Shell
cd docker-compose
```

```Shell
docker compose up
```

Open browser in the follow url [http://localhost:8888/webui/](http://localhost:8888/webui/)


![ADempiere ZK](docs/Docker_Compose_ZK.gif)

This will be generated in `adempiere-zk-ui/build/libs/adempiere-zk-ui.war`
