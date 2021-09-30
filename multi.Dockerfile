FROM maven:3.8.2-jdk-11 as build

WORKDIR /app

COPY pom.xml .
COPY src src

RUN mvn package

FROM openjdk:11.0.12-jre-slim

COPY --from=build /app/target/robxx-app-1.0-SNAPSHOT.jar app.jar

ENTRYPOINT ["java","-jar","/app.jar"]