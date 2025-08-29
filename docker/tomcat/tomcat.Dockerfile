FROM tomcat:9.0.108-jdk17-temurin-noble

LABEL manteiner="cparada@erpya.com; EdwinBetanc0urt@outlook.com;"
	
ENV \
	# Server
	ADEMPIERE_HOME="/opt/Adempiere" \
	ADEMPIERE_JAVA_OPTIONS="-Xms64M -Xmx1512M" \
	ADEMPIERE_CHARSET="UTF-8" \
	ADEMPIERE_LOG_LEVEL="WARNING" \
	# Database
	ADEMPIERE_DB_TYPE="PostgreSQL" \
	ADEMPIERE_DB_SERVER="localhost" \
	ADEMPIERE_DB_PORT="5432" \
	ADEMPIERE_DB_NAME="adempiere" \
	ADEMPIERE_DB_USER="adempiere" \
	ADEMPIERE_DB_PASSWORD="adempiere" \
	# System
	TZ="America/Caracas"

COPY docker/AdempiereTemplate.properties $ADEMPIERE_HOME/Adempiere.properties
COPY docker/tomcat/settings/*.xml $CATALINA_HOME/conf
COPY docker/tomcat/settings/setenv.sh $CATALINA_HOME/bin
COPY build/libs/zk-ui.war $CATALINA_HOME/webapps/webui.war
COPY build/libs/zk-ui.jar $CATALINA_HOME/lib
COPY build/distributions/zk-ui.zip $CATALINA_HOME/lib/zk-ui.zip

RUN apt update && apt install unzip && \
	ls $CATALINA_HOME/lib/ && \
	unzip -j -o $CATALINA_HOME/lib/zk-ui.zip -d $CATALINA_HOME/lib/ && \
	rm -R $CATALINA_HOME/lib/javaee-api* $CATALINA_HOME/lib/zk-ui.zip
