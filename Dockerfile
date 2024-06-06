# Use the official OpenJDK 17 image as the base image
FROM openjdk:17

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven executable to the container
COPY mvnw .
COPY .mvn .mvn

# Copy the pom.xml file and source code
COPY pom.xml .
COPY src src

# Build the application
RUN ./mvnw package

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "target/myapplication-0.0.1-SNAPSHOT.jar"]


