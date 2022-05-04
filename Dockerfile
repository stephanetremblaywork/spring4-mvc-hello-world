FROM tomcat:6.0-jre7

COPY target/helloworld.war /usr/local/tomcat/webapps/
EXPOSE 8080
