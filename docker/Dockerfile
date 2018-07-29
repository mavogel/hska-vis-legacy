FROM maven:3.5.4-jdk-8-alpine as builder

COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean package

FROM tomcat:8.0
COPY --from=builder /target/EShop-1.0.0.war /usr/local/tomcat/webapps/
ADD ./conf/tomcat-users.xml /usr/local/tomcat/conf/

EXPOSE 8080
