FROM maven as build
WORKDIR /app
copy . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from-build /app/target/devops-integration.jar /app/
EXPOSE 8080
CMD ["java","-jar","devops-integration.jar"]