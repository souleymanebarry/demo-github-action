# Stage 1 — Build
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -B -DskipTests

# Stage 2 — Runtime
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/demo-github-action-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
# Railway injecte $PORT dynamiquement — on le passe à Spring Boot
ENTRYPOINT ["sh", "-c", "java -jar -Dserver.port=${PORT:-8080} app.jar"]