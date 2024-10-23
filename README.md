# Ballerina Notion connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-notion/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-notion/actions/workflows/ci.yml)
[![Trivy](https://github.com/ballerina-platform/module-ballerinax-notion/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-notion/actions/workflows/trivy-scan.yml)
[![GraalVM Check](https://github.com/ballerina-platform/module-ballerinax-notion/actions/workflows/build-with-bal-test-graalvm.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-notion/actions/workflows/build-with-bal-test-graalvm.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-notion.svg)](https://github.com/ballerina-platform/module-ballerinax-notion/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/notion.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%notion)

## Overview

The Notion connector allows you to interact with Notion databases and pages programmatically. This module supports various REST API versions provided by Notion and enables you to perform operations such as reading, creating, and updating Notion pages and databases. It’s designed to streamline integration with Notion’s API by simplifying the credential setup and providing easy-to-use methods for interacting with Notion content.

## Setup guide

To use the Notion connector, you need to obtain the necessary credentials and configure them within your application. Follow the steps below to set up the credentials:

Step 1: Create a Notion Integration

1. Log in to your Notion account and navigate to Notion Integrations.

![create integration](https://github.com/ballerina-platform/module-ballerinax-notion/blob/main/docs/assets/create-integration.png?raw=true)

2. Click on New Integration.

![new integration](https://github.com/ballerina-platform/module-ballerinax-notion/blob/main/docs/assets/new-integration.png?raw=true)

3. Provide a name for your integration, and choose the workspace that this integration will have access to.

![integration created](https://github.com/ballerina-platform/module-ballerinax-notion/blob/main/docs/assets/integration-created.png?raw=true)

4. After creating the integration, you will see a page with your Integration Token (which you’ll need in the following steps). Copy the Integration Token and store it securely.

![copy secrets](https://github.com/ballerina-platform/module-ballerinax-notion/blob/main/docs/assets/secret.png?raw=true)

Step 2: Share a Notion Page with Your Integration

1. Go to the Notion page or database that you want your integration to access.
2. Click on the Share button at the top right corner of the page.
3. In the sharing options, search for your integration by the name you provided when creating it.
4. Grant the integration access by selecting it. This allows your integration to read or update the contents of the page or database.

![connect integration](https://github.com/ballerina-platform/module-ballerinax-notion/blob/main/docs/assets/connect-page.png?raw=true)

## Quickstart

### Step 1: Import the module

Import the `ballerinax/notion` module

```bal
import ballerinax/notion;
```

### Step 2: Instantiate a new connector

Create a `notion:ConnectionConfig` with the obtained OAuth2.0 tokens and initialize the connector with it.

```bal
configurable string authToken = ?;

final notion:Client notion = check new notion:Client(
    config = {
        auth: {
            token: authToken
        }
    }
);
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

#### Retrieve an existing page

```bal
PageResponse page = check notion->/v1/pages/["xyz-page-id"];
```

#### Creating a page inside another page

```bal
PageBodyParams payload = {
    "parent": {
        "type": "page_id",
        "page_id": testPageId
    },
    "properties": {
        "title": [
        {
            "text": {
            "content": "Test page"
            }
        }
        ]
    },
    "icon": {
        "emoji": "🥬"
    }
};
PageResponse response = check notion->/v1/pages.post(payload);
```

## Examples

The `ballerinax/notion` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-notion/tree/main/examples), covering use cases like creating pages, retrieving users, and managing databases.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 17. You can download it from either of the following sources:

    - [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    - [OpenJDK](https://adoptium.net/)

    > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

    > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

    ```bash
    ./gradlew clean build
    ```

2. To run the tests:

    ```bash
    ./gradlew clean test
    ```

3. To build the without the tests:

    ```bash
    ./gradlew clean build -x test
    ```

4. To run tests against different environments:

    ```bash
    ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
    ```

5. To debug the package with a remote debugger:

    ```bash
    ./gradlew clean build -Pdebug=<port>
    ```

6. To debug with the Ballerina language:

    ```bash
    ./gradlew clean build -PbalJavaDebug=<port>
    ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToCentral=true
    ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

-   For more information go to the [`ballerinax/notion` package](https://central.ballerina.io/ballerinax/notion/latest).
-   For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
-   Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
-   Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
