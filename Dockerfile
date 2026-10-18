FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /build

COPY pom.xml .
RUN mvn -B dependency:go-offline
COPY src ./src
RUN mvn -B package
RUN mkdir /build/war
RUN cd /build/war && jar xf /build/target/demo-1.0-SNAPSHOT.war

FROM tomcat:9.0-jdk21-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /build/war/ /usr/local/tomcat/webapps/ROOT/
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/img

EXPOSE 8080
