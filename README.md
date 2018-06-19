# Rookout official tutorial for using java 

[![CircleCI](https://circleci.com/gh/Rookout/tutorial-java/tree/master.svg?style=svg&circle-token=67fb4681a9af2ce964fd715e45d4c2eafaa01503)](https://circleci.com/gh/Rookout/tutorial-java/tree/master)
[![License][license-image]][license-url]
[![Docs][docs-image]][docs-url]
[![GitHub version][version-badge]](https://github.com/Rookout/tutorial-java)

this is the official [rookout][rookout-getting-started] java tutorial

- [Signup][rookout-signup]
- [Documentation][docs-url]
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Prerequisites

1. Docker - https://www.docker.com/get-docker
2. java 8
3. gradle - https://gradle.org/install/ (you can skip it and use only docker - including for build)

## Installation
**Note: you need `docker` for the agent**

1. Clone this repo

```bash
git clone https://github.com/Rookout/tutorial-java.git
cd tutorial-java
``` 

2. Set your agent token in an ENV variable 

```bash
export ROOKOUT_TOKEN=YOUR_TOKEN_IN_HERE
 ```

3. Build the app then run the agent & app

- Building the app without installing gradle:

```bash
make build-jar-with-docker
```

- Building the app with gradle:

```bash
make build-jar-local
```

- Running the app locally

```bash
make run-local
```

- Running the app with docker

```bash
make run-docker
```

## Usage

- After running the app & agent go to [https://app.rookout.com/][rookout-app-url] and **Log In**
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
            - Choose a supported HTTP Server (Node.js)
            - Leave the default port `8000` or choose your own
            - Run your local server e.g. `simple-https -p 8000` in the right directory
            - Click on Connect to Server
    </p>
    </details>
    
    
- Open the file `src/main/java/com/rookout/tutorial/TodoController.java`
- Add a default (Dump Frame) rule to the `addTodo` function by clicking next the the line number in the file viewer
- Looking at the right-hand pane **Rules**, you will see the rule and the line number where you added it - it should be GREEN.
    - If this is not the case, [click here](#rule-common-issues) to see how to fix that
- Go the the app page - [http://localhost:8080/](http://localhost:8080/) and add try to add a task to the todo list
- Check the bottom pane **Messages** and you'll see the dumpframe you just added- it was triggered by the handler of the web page when you accessed it!

## Rule Common Issues

- Rule status is RED -- Hash mismatch. It means the file used in the server is not the same file used from github/local server in app.rookout.com
- Rule status is GRAY -- No rook connected to the agent. Make sure you have inserted the token in the right place and that connection is made properly.

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
[version-badge]: https://badge.fury.io/gh/rookout%2Ftryme-tutorial.svg
