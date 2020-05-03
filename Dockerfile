FROM openjdk:8-jdk as build

ARG GIT_COMMIT=unspecified
ENV ROOKOUT_COMMIT=$GIT_COMMIT

ARG GIT_ORIGIN=unspecified
ENV ROOKOUT_REMOTE_ORIGIN=$GIT_ORIGIN

RUN mkdir -p /app
WORKDIR /app
ADD build.gradle /app
ADD . /app
RUN ./gradlew -i bootJar downloadRook

# ---------------------------------------------------------- #

FROM openjdk:8-jdk as release
RUN mkdir -p /app
# Copy the jar image (which already include resoures)
COPY --from=build /app/build/libs/tutorial-1.0.0.jar  /app/tutorial-1.0.0.jar
# Copy the rook.jar downloaded in build phase
COPY --from=build /app/rook.jar rook.jar
ENTRYPOINT ["java", "-javaagent:rook.jar", "-jar", "/app/tutorial-1.0.0.jar"]
