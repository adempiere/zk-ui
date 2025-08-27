#!/bin/sh
################################################################################
#  ADempiere Setting script                                                   ##
#  Setting ADempiere Server                                                   ##
################################################################################

# Adempiere Application Type
export ADEMPIERE_APPS_TYPE="jetty"

# Read password from secret file if defined
if [ -n "$ADEMPIERE_DB_PASSWORD_FILE" ] && [ -f "$ADEMPIERE_DB_PASSWORD_FILE" ]; then
  export ADEMPIERE_DB_PASSWORD=$(cat "$ADEMPIERE_DB_PASSWORD_FILE")
fi

#Set Database Type
case $ADEMPIERE_DB_TYPE in 
	PostgreSQL) 
		 export ADEMPIERE_CLASS_FORNAME=org.postgresql.Driver
		 export ADEMPIERE_DB_JDBC_URL="jdbc\:postgresql\://$ADEMPIERE_DB_SERVER\:$ADEMPIERE_DB_PORT/$ADEMPIERE_DB_NAME"
		 ;;
	Oracle)
		 export ADEMPIERE_CLASS_FORNAME=oracle.jdbc.driver.OracleDriver
		 export ADEMPIERE_DB_JDBC_URL="jdbc:oracle:thin:@$ADEMPIERE_DB_SERVER:$ADEMPIERE_DB_PORT:$ADEMPIERE_DB_NAME"
		 ;;
	*)
		echo "Invalid DataBase Type"
esac

#Replace values in Adempiere.properties
sed -i "s|@ADEMPIERE_DB_SERVER@|$ADEMPIERE_DB_SERVER|g" $ADEMPIERE_HOME/Adempiere.properties
sed -i "s|@ADEMPIERE_DB_PORT@|$ADEMPIERE_DB_PORT|g" $ADEMPIERE_HOME/Adempiere.properties
sed -i "s|@ADEMPIERE_DB_NAME@|$ADEMPIERE_DB_NAME|g" $ADEMPIERE_HOME/Adempiere.properties
sed -i "s|@ADEMPIERE_DB_USER@|$ADEMPIERE_DB_USER|g" $ADEMPIERE_HOME/Adempiere.properties
sed -i "s|@ADEMPIERE_DB_PASSWORD@|$ADEMPIERE_DB_PASSWORD|g" $ADEMPIERE_HOME/Adempiere.properties
sed -i "s|xyzWARNING|$ADEMPIERE_LOG_LEVEL|g" $ADEMPIERE_HOME/Adempiere.properties
sed -i "s|xyzUTF-8|$ADEMPIERE_CHARSET|g" $ADEMPIERE_HOME/Adempiere.properties

#Replace Values in server.xml
sed -i "s|@ADEMPIERE_DB_JDBC_URL@|$ADEMPIERE_DB_JDBC_URL|g" $JETTY_BASE/jetty-ds.xml
sed -i "s|@ADEMPIERE_CLASS_FORNAME@|$ADEMPIERE_CLASS_FORNAME|g" $JETTY_BASE/jetty-ds.xml
sed -i "s|@ADEMPIERE_DB_SERVER@|$ADEMPIERE_DB_SERVER|g" $JETTY_BASE/jetty-ds.xml
sed -i "s|@ADEMPIERE_DB_PORT@|$ADEMPIERE_DB_PORT|g" $JETTY_BASE/jetty-ds.xml
sed -i "s|@ADEMPIERE_DB_NAME@|$ADEMPIERE_DB_NAME|g" $JETTY_BASE/jetty-ds.xml
sed -i "s|@ADEMPIERE_DB_USER@|$ADEMPIERE_DB_USER|g" $JETTY_BASE/jetty-ds.xml
sed -i "s|@ADEMPIERE_DB_PASSWORD@|$ADEMPIERE_DB_PASSWORD|g" $JETTY_BASE/jetty-ds.xml

sed -i "s|/usr/local/jetty/etc/jetty-http.xml|/usr/local/jetty/etc/jetty-http.xml /var/lib/jetty/jetty-ds.xml|g" $JETTY_BASE/jetty.start
sed -i "s|-Djetty.base=/var/lib/jetty|-Djetty.base=/var/lib/jetty -DADEMPIERE_HOME=$ADEMPIERE_HOME|g" $JETTY_BASE/jetty.start

/docker-entrypoint.sh
