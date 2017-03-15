FROM tomcat:8.0
MAINTAINER Manuel Vogel

ADD ./target/EShop-1.0.0.war /usr/local/tomcat/webapps/
ADD ./conf/tomcat-users.xml /usr/local/tomcat/conf/

EXPOSE 8080