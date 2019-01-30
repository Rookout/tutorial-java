FROM openjdk:8-jdk

RUN mkdir -p /app/

# Copy the jar image (which already include resoures)
COPY build/libs/tutorial-1.0.0.jar  /app/tutorial-1.0.0.jar

# Download the Rookout agent jar
RUN wget "http://repository.sonatype.org/service/local/artifact/maven/redirect?r=central-proxy&g=com.rookout&a=rook&v=inner-999.0.908"  -O rook.jar
ENTRYPOINT ["java", "-javaagent:rook.jar", "-jar", "/app/tutorial-1.0.0.jar"]
