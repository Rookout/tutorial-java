PUBLISH_VERSION=$(shell echo ${NEW_VERSION} | sed 's/inner-999/1/g')

build-jar-with-docker:
	rm -rf build
	# Build the build/libs/tutorial-V.V.V - which already includes the project sources in the jar
	docker run --rm -v "$(shell pwd)":/home/gradle/project -w /home/gradle/project gradle:4.8.0-jdk8-alpine gradle -i bootJar

build-jar-local:
	gradle -i clean
	# Build the build/libs/tutorial-V.V.V - which already includes the project sources in the jar
	gradle -i bootJar

run-local:
	docker-compose up -d rookout-python-agent
	# Download the javaagent for local run
	wget "http://repository.sonatype.org/service/local/artifact/maven/redirect?r=central-proxy&g=com.rookout&a=rook&v=LATEST"  -O rook.jar
	# Run the app with the Rookout Java agent
	java  -javaagent:rook.jar -jar build/libs/tutorial-1.0.0.jar

build-docker:
	docker-compose build

run-docker:
	docker-compose up


build-img:
	docker build --tag rookout/tutorial-java:latest --tag rookout/tutorial-java:${PUBLISH_VERSION} .

upload-no-latest:
	docker push rookout/tutorial-java:${PUBLISH_VERSION}

upload: upload-no-latest
	@if [ ${CIRCLE_BRANCH} = "master" ]; then \
		docker push rookout/tutorial-java:latest; \
	fi

build-and-upload: build-img upload
