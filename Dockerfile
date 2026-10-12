FROM maven:3.9-eclipse-temurin-8 AS build

WORKDIR /app
COPY pom.xml .
RUN mvn -B dependency:go-offline

COPY src ./src
RUN mvn -B clean package -DskipTests

FROM tomcat:9.0-jdk8-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=build /app/target/project-lecture.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
# Render provides the listening port through PORT. Tomcat defaults to 8080 locally.
CMD ["sh", "-c", "PORT=${PORT:-8080}; sed -i \"s/port=\\\"8080\\\"/port=\\\"$PORT\\\"/\" /usr/local/tomcat/conf/server.xml; exec catalina.sh run"]
