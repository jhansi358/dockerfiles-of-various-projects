# Stage 1: Build Java application
  #simple helloworld dockerfile saved as jhany999/nocturnalimage in hub
  2 FROM maven:3.9.11-eclipse-temurin-11 AS builder
  3 WORKDIR /app
  4 RUN git clone https://github.com/nocturnaldevops/DemoProject.git .
  5 RUN mvn clean package
  6 
  7 # Stage 2: Deploy WAR to Tomcat
  8 FROM tomcat:10.1.16-jdk11-temurin
  9 COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/app.war