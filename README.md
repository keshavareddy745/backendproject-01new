# Backend for FEDF Project 3

This is the Spring Boot backend for the FEDF Project 3 frontend.

## Getting Started

### Prerequisites
- Java 17 (Download from https://adoptium.net/)
- Maven (Download from https://maven.apache.org/download.cgi and add to PATH)

### Running the Application
1. Navigate to the backend directory
2. Run `mvn spring-boot:run`

The application will start on port 8080.

### H2 Database Console
Access the H2 console at http://localhost:8080/h2-console

Use the following connection details:
- JDBC URL: jdbc:h2:mem:testdb
- Username: sa
- Password: password