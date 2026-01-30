
#MULTISTAGE DOCKER FILE

FROM maven AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package 

FROM amazoncorretto:17
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
