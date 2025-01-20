// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License. 

import ballerina/test;
import ballerina/os;

configurable boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
configurable string authToken = isLiveServer ? os:getEnv("NOTION_AUTH_TOKEN") : "test_token";
configurable string testBlockId = isLiveServer ? os:getEnv("TEST_BLOCK_ID") : "test_block_id";
configurable string testDatabaseId = isLiveServer ? os:getEnv("TEST_DATABASE_ID") : "test_database_id";
configurable string testPageId = isLiveServer ? os:getEnv("TEST_PAGE_ID") : "test_page_id";
configurable string testUserId = isLiveServer ? os:getEnv("TEST_USER_ID") : "test_user_id";
configurable string serviceUrl = isLiveServer ? "https://api.notion.com" : "http://localhost:9090";

Client notion = check new Client(
    config = {
        auth: {
            token: authToken
        }
    },
    serviceUrl = serviceUrl
);

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListAllUsers() returns error? {
    GetV1UsersHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    PaginatedUsers paginatedUsers = check notion->/v1/users(headers);
    test:assertNotEquals(paginatedUsers, (), "User list response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testRetrieveUser() returns error? {
    GetV1UsersIdHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    User user = check notion->/v1/users/[testUserId](headers);
    test:assertNotEquals(user, (), "Retrieved user should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testAppendBlockChildren() returns error? {
    PatchV1BlocksIdChildrenHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    ChildBlockContent payload = {
        children: [{
            'object: "block",
            'type: "heading_2",
            heading_2: {
                rich_text: [{ "type": "text", "text": { "content": "Lacinato kale" } }]
            }
        },
        {
            'object: "block",
            'type: "paragraph",
            paragraph: {
                rich_text: [
                    {
                        'type: "text",
                        text: {
                            content: "Lacinato kale is a variety of kale with a long tradition in Italian cuisine, especially that of Tuscany. It is also known as Tuscan kale, Italian kale, dinosaur kale, kale, flat back kale, palm tree kale, or black Tuscan palm.",
                            link: { url: "https://en.wikipedia.org/wiki/Lacinato_kale" }
                        }
                    }
                ]
            }
        }]
    };
    ChildBlockContent childBlockContent = check notion->/v1/blocks/[testBlockId]/children.patch(payload, headers);
    test:assertNotEquals(childBlockContent, (), "Appended block children response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateDatabase() returns error? {
    PostV1DatabasesHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    CreateDatabaseRequest payload = {
        parent: {
            page_id: "897df8e5db924877b1f0238b499d61d4"
        },
        title: [
            {
                text: {
                    content: "Test database"
                }
            }
        ],
        properties: {
            Name: {
                title: {}
            },
            Description: {
                rich_text: {}
            },
            In\ stock: {
                checkbox: {}
            },
            Food\ group: {
                'select: {
                    options: [
                        {
                            name: "🥦Vegetable",
                            color: "green"
                        },
                        {
                            name: "🍎Fruit",
                            color: "red"
                        },
                        {
                            name: "💪Protein",
                            color: "yellow"
                        }
                    ]
                }
            },
            Price: {
                number: {
                    format: "dollar"
                }
            },
            Last\ ordered: {
                date: {}
            },
            Store\ availability: {
                multi_select: {
                    options: [
                        {
                            name: "Duc Loi Market",
                            color: "blue"
                        },
                        {
                            name: "Rainbow Grocery",
                            color: "gray"
                        },
                        {
                            name: "Nijiya Market",
                            color: "purple"
                        },
                        {
                            name: "Gus's Community Market",
                            color: "yellow"
                        }
                    ]
                }
            },
            Photo: {
                files: {}
            }
        }   
    };
    CreateDatabaseResponse databaseBodyParams = check notion->/v1/databases.post(payload, headers);
    test:assertNotEquals(databaseBodyParams, (), "Created database response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreatePage() returns error? {
    PostV1PagesHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    PageResponse payload = {
        parent: {
            database_id: "180f9eb1-5b47-8191-8504-d9b3cec910ae"
        },
        properties: {
            Name: {
                title: [{
                    "text": {
                        "content": "New Media Article"
                    }
                }]
            }
        }
    };
    PageResponse pageResponse = check notion->/v1/pages.post(payload, headers);
    test:assertNotEquals(pageResponse, (), "Created page response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testSearchPages() returns error? {
    PostV1SearchHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    SearchRequest payload = {
        query: "Test"
    };
    SearchResponse searchResponse = check notion->/v1/search.post(payload, headers);
    test:assertNotEquals(searchResponse, (), "Search pages response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetBlockChildren() returns error? {
    GetV1BlocksIdChildrenHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    BlockChildrenResponse blockChildrenResponse = check notion->/v1/blocks/[testBlockId]/children(headers);
    test:assertNotEquals(blockChildrenResponse, (), "Block children response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testRetrieveDatabase() returns error? {
    GetV1DatabasesIdHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    Database response = check notion->/v1/databases/[testDatabaseId](headers);
    test:assertNotEquals(response, (), "Retrieved database should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testRetrievePage() returns error? {
    GetV1PagesIdHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    PageResponse pageResponse = check notion->/v1/pages/[testPageId](headers);
    test:assertNotEquals(pageResponse, (), "Retrieved page should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testRetrieveBlock() returns error? {
    GetV1BlocksIdHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    BlockResponse response = check notion->/v1/blocks/[testBlockId](headers);
    test:assertNotEquals(response, (), "Retrieved block should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testRetrieveComments() returns error? {
    GetV1CommentsHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    GetV1CommentsQueries queries = {
        block_id: testBlockId,
        page_size: 10
    };
    CommentResponse response = check notion->/v1/comments(headers, queries);
    test:assertNotEquals(response, (), "Comments response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testUpdateDatabase() returns error? {
    PatchV1DatabasesIdHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    DatabasePatchRequest payload = {
        title: [
            {
                text: {
                    content: "Updated database"
                }
            }
        ]
    };
    Database response = check notion->/v1/databases/[testDatabaseId].patch(payload, headers);
    test:assertNotEquals(response, (), "Update database response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testRetrievePageProperty() returns error? {
    GetV1PagesPage_idPropertiesProperty_idHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    RollupListPropertyItem|PropertyItemResult|NumberPropertyItem response = check notion->/v1/pages/[testPageId]/properties/["title"](headers);
    test:assertNotEquals(response, (), "Page property response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testAddComment() returns error? {
    PostV1CommentsHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    CommentRequest payload = {
        parent: {
            page_id: testPageId
        },
        rich_text: [
            {
                text: {
                    content: "Test comment"
                }
            }
        ]
    };
    Comment response = check notion->/v1/comments.post(payload, headers);
    test:assertNotEquals(response, (), "Add comment response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testArchivePage() returns error? {
    PatchV1PagesIdHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    ArchivePageRequest payload = {
        archived: false
    };
    PageUpdatedProperties response = check notion->/v1/pages/[testPageId].patch(payload, headers);
    test:assertNotEquals(response, (), "Archive page response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testQueryDatabase() returns error? {
    PostV1DatabasesIdQueryHeaders headers = {
        "Notion-Version": "2022-06-28"
    };
    DatabaseContent payload = {
        filter: {
            or: []
        }
    };
    DatabaseQueryResponse response = check notion->/v1/databases/[testDatabaseId]/query.post(payload, headers);
    test:assertNotEquals(response, (), "Query database response should not be null");
}
