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

## Setup

1. Clone the sample app from this repository:

```bash
git clone https://github.com/Rookout/tutorial-java.git
cd tutorial-java
``` 

2. Set your agent token as an environment variable (for Windows, use ***set*** instead of ***export)

```bash
export ROOKOUT_TOKEN=[Your Rookout Token]
 ```

3. Build and run the app

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

- Add a default (Dump Frame) rule to the `addTodo` function by clicking next the the line number in the file viewer
![Dumpframe Rule](/img/screenshots/java-tutorial_2.png)

- Looking at the right-hand pane **Rules**, you will see the rule and the line number where you added it - it should be <span style="color: #73CD1F;">**GREEN**</span>   
    ![Valid Rule](/img/screenshots/java-tutorial_3.png)
    - **If this is not the case, [check our troubleshooting guide](https://docs.rookout.com/docs/troubleshooting-rules.html)**
     
- Go the the app page - [http://localhost:8080/](http://localhost:8080/) and add try to add a task to the todo list

![Add Task](/img/screenshots/java-tutorial_4.png)

- Check the bottom pane **Messages** and you'll see the dumpframe you just added - it was triggered by the handler of the web page when you accessed it!

![Message pane](/img/screenshots/java-tutorial_5.png)

## Rule Common Issues

- Rule status is RED -- Hash mismatch. It means the file used in the server is not the same file used from github/local server in app.rookout.com
- Rule status is GRAY -- No rook connected to the agent. Make sure you have inserted the token in the right place and that connection is made properly.

## Bug Hunt

Great! You're now ready to start debugging, let's start by having some fun with our 
[bug hunt](tutorials-bughunt-java.md) - follow the instructions to try out some basic use cases.


## Want to learn more ?

- [Our documentation][docs-url] for more information
- [our deployment examples][deployment-examples] for platform-specific integration examples


## License
[APACHE 2](LICENSE)

[rookout-getting-started]: https://docs.rookout.com/docs/introduction.html
[rookout-signup]: https://www.rookout.com/trial/
[license-url]: LICENSE
[docs-image]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-url]: https://docs.rookout.com/
[license-image]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[rookout-app-url]: https://app.rookout.com/
[deployment-examples]: https://github.com/Rookout/deployment-examples
[version-badge]: https://badge.fury.io/gh/rookout%2Ftutorial-java.svg
