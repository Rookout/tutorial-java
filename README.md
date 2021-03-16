# Rookout tutorial for debugging Java applications

[![CircleCI](https://circleci.com/gh/Rookout/tutorial-java/tree/master.svg?style=svg&circle-token=67fb4681a9af2ce964fd715e45d4c2eafaa01503)](https://circleci.com/gh/Rookout/tutorial-java/tree/master)
[![License][license-image]][license-url]
[![Docs][docs-image]][docs-url]
[![GitHub version][version-badge]](https://github.com/Rookout/tutorial-java)

A sample app for debugging Java using [Rookout][rookout-getting-started].

## Helpful links:

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [License](#license)
- [Sign up to Rookout][rookout-signup]
- [Online Documentation][docs-url]

## Prerequisites


1. Java 8
2. Docker (optional) - https://www.docker.com/get-docker
3. Jaegar Agent - https://www.jaegertracing.io/docs/getting-started/

## Setup

1. Clone the sample app from this repository:

```bash
git clone https://github.com/Rookout/tutorial-java.git
cd tutorial-java
``` 

2. Set your Rookout Token as an environment variable (for Windows, use ***set*** instead of ***export)

```bash
export ROOKOUT_TOKEN=[Your Rookout Token]
 ```

3. This application uses Jaegar for tracing and requires the Jaegar agent be running before starting the application. The simplest approach to setting this up would be to start the All-In-One pre-built Docker image as described here: https://www.jaegertracing.io/docs/1.22/getting-started/#all-in-one.

4. After starting Jaegar, ensure that the file `src/main/resources/application.properties` is updated with the host and port of your Jaegar agent. For example:

```bash
opentracing.jaeger.udp-sender.host=localhost
opentracing.jaeger.udp-sender.port=6831
```

5. Build and run the app

Build and run the app using Gradle:

```bash
./gradlew bootJar run
```

- Optional - Run the app using docker (Java & Gradle are not required)

```bash
docker run -p 8080:8080 -e "ROOKOUT_TOKEN=[Your Rookout Token]" rookout/tutorial-java
```

## Usage

- Log in to [the Rookout IDE][rookout-app-url].
- Select the server(s) to debug based on the labels in the server selection screen
- Add the source code according to the instructions using the left pane **Source View**

    <details>
    <summary>More details</summary>
    <p>
    
    #### Adding source code
    
    1. Click on Add source
    1. Choose source control
        - Github
            - Click on Connect
            - Authorize O-Auth
            - Fill `Repository Owner`
            - Click `Repository` and choose from the dropdown menu
            - Click Next
            - Choose the desired branch
            - Click View Repository
        - Local FileSystem - Server
            - Click on Setup Server
            - Choose a supported HTTP Server
            - Follow the on-screen instructions
    </p>
    </details>
    
    
- Open the file `src/main/java/com/rookout/tutorial/TodoController.java`    
![TodoController.java](/img/screenshots/java-tutorial_1.png)

- Add a Breakpoint to the `addTodo` function by clicking next the line number in the file viewer
![Snapshot Breakpoint](/img/screenshots/java-tutorial_2.png)

- Click on the **Breakpoints** tab in the left pane, and you will see the Breakpoint and the line number where you added it - it should be solid purple.    
    ![Valid Breakpoint](/img/screenshots/java-tutorial_3.png)
    - **If this is not the case, [check our troubleshooting guide](https://docs.rookout.com/docs/breakpoints-status.html)**
     
- Go the the app page - [http://localhost:8080/](http://localhost:8080/) and add try to add a task to the todo list

![Add Task](/img/screenshots/java-tutorial_4.png)

- Check the bottom pane **Messages** and you'll see the dumpframe you just added - it was triggered by the handler of the web page when you accessed it!

![Message pane](/img/screenshots/java-tutorial_5.png)

## Common Pitfalls

- Breakpoint status is pending (hollow with purple outline) -- Connection to the app was not able to be established. Make sure that you inserted the Rookout Token in the right place and that the SDK was properly installed.
- Breakpoing status is disabled (solid grey) -- The breakpoint was disabled from collecting more data due to the limits being hit.
- Brekapoint error -- something went wrong. Check the breakpoint status to get more information on the error type, and for more information go to our [breakpoint status guide][https://docs.rookout.com/docs/breakpoints-status/].

## Bug Hunt

Great! You're now ready to start debugging, let's start by having some fun with our 
[bug hunt](tutorials-bughunt-java.md) - follow the instructions to try out some basic use cases.


## Want to learn more ?

- [Our documentation][docs-url] for more information
- [our deployment examples][deployment-examples] for platform-specific integration examples


## License
[APACHE 2](LICENSE)

[rookout-getting-started]: https://docs.rookout.com/docs/quick-start.html
[rookout-signup]: https://www.rookout.com/trial/
[license-url]: LICENSE
[docs-image]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-url]: https://docs.rookout.com/
[license-image]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[rookout-app-url]: https://app.rookout.com/
[deployment-examples]: https://github.com/Rookout/deployment-examples
[version-badge]: https://badge.fury.io/gh/rookout%2Ftutorial-java.svg
