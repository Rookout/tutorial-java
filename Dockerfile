FROM openjdk:8-jdk

RUN mkdir -p /app/

# Copy the jar image (which already include resoures)
COPY build/libs/tutorial-1.0.0.jar  /app/tutorial-1.0.0.jar

# Download the Rookout agent jar
RUN wget "https://oss.sonatype.org/service/local/repositories/releases/content/com/rookout/0.1.53/rook-0.1.53.jar" -O rook.jar
ENTRYPOINT ["java", "-javaagent:rook.jar", "-jar", "/app/tutorial-1.0.0.jar"]
