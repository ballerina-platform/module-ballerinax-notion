# Ballerina Notion connector

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
PageResponse result = check notion->/v1/pages/["xyz-page-id"];
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

1. [Creating a new page](https://github.com/ballerina-platform/module-ballerinax-notion/blob/main/examples/CreateNewPage/main.bal)
2. [Retrieve existing pages](https://github.com/ballerina-platform/module-ballerinax-notion/blob/main/examples/RetrievePage/main.bal)
3. [Retrieve list of all users](https://github.com/ballerina-platform/module-ballerinax-notion/blob/main/examples/ListAllUsers/main.bal)
4. [Create a new database](https://github.com/ballerina-platform/module-ballerinax-notion/blob/main/examples/CreateDatabase/main.bal)

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
