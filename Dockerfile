# Stage 1: Build the application
FROM openjdk:21-jdk-slim as builder

WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
COPY mvnw.cmd .

# Copy source code
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Stage 2: Runtime image
FROM openjdk:21-jre-slim

WORKDIR /app

# Copy the built JAR from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose port 8082
EXPOSE 8082

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD java -cp app.jar org.springframework.boot.loader.JarLauncher || exit 1

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
