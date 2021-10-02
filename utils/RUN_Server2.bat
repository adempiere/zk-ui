@if (%ADEMPIERE_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %ADEMPIERE_HOME%\utils\myEnvironment.bat Server)
@Title Adempiere Server Start - %ADEMPIERE_HOME% (%ADEMPIERE_APPS_TYPE%)

@Rem $Id: RUN_Server2.bat,v 1.24 2005/10/26 00:38:18 jjanke Exp $

@Rem  To use your own Encryption class (implementing org.compiere.util.SecureInterface),
@Rem  you need to set it here (and in the client start script) - example:
@Rem  SET SECURE=-DADEMPIERE_SECURE=org.compiere.util.Secure
@SET SECURE=


@IF '%ADEMPIERE_APPS_TYPE%' == 'wildfly' GOTO WILDFLY
@IF '%ADEMPIERE_APPS_TYPE%' == 'tomcat' GOTO TOMCAT
@IF '%ADEMPIERE_APPS_TYPE%' == 'jetty' GOTO JETTY
@GOTO UNSUPPORTED

:WILDFLY
@Set NOPAUSE=Yes
@Set WILDFLY_BASE=%ADEMPIERE_HOME%\wildfly
@Set JAVA_OPTS=-server %ADEMPIERE_JAVA_OPTIONS% %SECURE% -Dorg.adempiere.server.embedded=true
@Echo Start Adempiere Apps Server %ADEMPIERE_HOME% (%ADEMPIERE_DB_NAME%)
@Call %WILDFLY_HOME%\bin\standalone.bat -Djboss.server.base.dir=$WILDFLY_BASE --start-mode normal -Djboss.http.port=%ADEMPIERE_WEB_PORT% -Djboss.https.port=%ADEMPIERE_SSL_PORT% -Djboss.bind.address=0.0.0.0
@GOTO END

:TOMCAT
@Set NOPAUSE=Yes
@Rem @Set CATALINA_HOME=..\tomcat
@Set JAVA_OPTS=-server %ADEMPIERE_JAVA_OPTIONS% %SECURE% -Dorg.adempiere.server.embedded=true --add-exports java.base/jdk.internal.misc=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED
@Echo Start Adempiere Apps Server %ADEMPIERE_HOME% (%ADEMPIERE_DB_NAME%)
@Call ..\tomcat\bin\startup.bat
@Echo Done Adempiere Apps Server %ADEMPIERE_HOME% (%ADEMPIERE_DB_NAME%)
@GOTO END

:JETTY
@Set NOPAUSE=Yes
@Set JETTY_BASE=%ADEMPIERE_HOME%\jetty
@Set JAVA_OPTS=-server %ADEMPIERE_JAVA_OPTIONS% %SECURE% -Dorg.adempiere.server.embedded=true
@Echo Start Adempiere Apps Server %ADEMPIERE_HOME% (%ADEMPIERE_DB_NAME%)
@Call java $JAVA_OPTS -jar %JETTY_HOME%/start.jar jetty.base=%ADEMPIERE_HOME%/jetty --create-start-d --add-modules=server,ext,deploy,jndi,jsp,http jetty.http.port=%ADEMPIERE_WEB_PORT% jetty.server.stopAtShutdown=true %JETTY_BASE%/jetty-ds.xml
@Call java $JAVA_OPTS -jar %JETTY_HOME%/start.jar jetty.base=%ADEMPIERE_HOME%/jetty %JETTY_BASE%/jetty-ds.xml
@Echo Done Adempiere Apps Server %ADEMPIERE_HOME% (%ADEMPIERE_DB_NAME%)
@GOTO END

:UNSUPPORTED
@Echo Apps Server start of %ADEMPIERE_APPS_TYPE% not supported

:END
@Rem Sleep 60
@CHOICE /C YN /T 60 /D N > NUL

@Exit