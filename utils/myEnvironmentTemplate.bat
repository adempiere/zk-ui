@Rem	myEnvironment defines the variables used for Adempiere
@Rem	Do not edit directly - use RUN_setup
@Rem	
@Rem	$Id: myEnvironmentTemplate.bat,v 1.12 2005/01/22 21:59:15 jjanke Exp $

@Echo Setting myEnvironment ....
@Rem	Clients only needs
@Rem		ADEMPIERE_HOME
@Rem		JAVA_HOME 
@Rem	Server install needs to check
@Rem		ADEMPIERE_DB_NAME	(for Oracle)
@Rem		passwords

@Rem 	Homes ...
@SET ADEMPIERE_HOME=@ADEMPIERE_HOME@
@SET JAVA_HOME=@JAVA_HOME@


@Rem	Database ...
@SET ADEMPIERE_DB_SERVER=@ADEMPIERE_DB_SERVER@
@SET ADEMPIERE_DB_USER=@ADEMPIERE_DB_USER@
@SET ADEMPIERE_DB_PASSWORD=@ADEMPIERE_DB_PASSWORD@
@SET ADEMPIERE_DB_URL=@ADEMPIERE_DB_URL@
@SET ADEMPIERE_DB_PORT=@ADEMPIERE_DB_PORT@

@Rem	Oracle specifics
@SET ADEMPIERE_DB_PATH=@ADEMPIERE_DB_PATH@
@SET ADEMPIERE_DB_NAME=@ADEMPIERE_DB_NAME@
@SET ADEMPIERE_DB_SYSTEM=@ADEMPIERE_DB_SYSTEM@

@Rem	Homes(2)
@SET ADEMPIERE_DB_HOME=@ADEMPIERE_HOME@\utils\@ADEMPIERE_DB_TYPE@

@SET WILDFLY_BASE=@ADEMPIERE_HOME@\wildfly
@SET TOMCAT_BASE=@ADEMPIERE_HOME@\tomcat
@SET JETTY_BASE=@ADEMPIERE_HOME@\jetty

@Rem	Apps Server
@SET ADEMPIERE_APPS_TYPE=@ADEMPIERE_APPS_TYPE@
@SET ADEMPIERE_APPS_SERVER=@ADEMPIERE_APPS_SERVER@
@SET ADEMPIERE_JNP_PORT=@ADEMPIERE_JNP_PORT@
@SET ADEMPIERE_WEB_PORT=@ADEMPIERE_WEB_PORT@
@SET ADEMPIERE_APPS_DEPLOY=@ADEMPIERE_APPS_TYPE@
@Rem	SSL Settings
@SET ADEMPIERE_SSL_PORT=@ADEMPIERE_SSL_PORT@
@SET ADEMPIERE_KEYSTORE=@ADEMPIERE_KEYSTORE@
@SET ADEMPIERE_KEYSTOREWEBALIAS=@ADEMPIERE_KEYSTOREWEBALIAS@
@SET ADEMPIERE_KEYSTOREPASS=@ADEMPIERE_KEYSTOREPASS@

@Rem	etc.
@SET ADEMPIERE_FTP_SERVER=@ADEMPIERE_FTP_SERVER@
@SET ADEMPIERE_FTP_USER=@ADEMPIERE_FTP_USER@

@Rem	Java
@SET ADEMPIERE_JAVA=@JAVA_HOME@\bin\java
@SET ADEMPIERE_JAVA_OPTIONS=@ADEMPIERE_JAVA_OPTIONS@ -DADEMPIERE_HOME=@ADEMPIERE_HOME@
@SET CLASSPATH="@ADEMPIERE_HOME@\lib\Adempiere.jar;@ADEMPIERE_HOME@\lib\AdempiereCLib.jar;"

@Rem Save Environment file
@if (%1) == () copy myEnvironment.bat myEnvironment_%RANDOM%.bat /Y 

