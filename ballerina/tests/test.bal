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
function testGetBlockChildren() returns error? {
    BlockChildrenResponse response = check notion->/v1/blocks/[testBlockId]/children(); 
    test:assertNotEquals(response, (), "Block children response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testRetrieveDatabase() returns error? {
    Database response = check notion->/v1/databases/[testDatabaseId]; 
    test:assertNotEquals(response, (), "Retrieved database should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testRetrievePage() returns error? {
    PageResponse response = check notion->/v1/pages/[testPageId]; 
    test:assertNotEquals(response, (), "Retrieved page should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListAllUsers() returns error? {
    PaginatedUsers response = check notion->/v1/users; 
    test:assertNotEquals(response, (), "User list response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testRetrieveUser() returns error? {
    User response = check notion->/v1/users/[testUserId];
    test:assertNotEquals(response, (), "Retrieved user should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testAppendBlockChildren() returns error? {
    PageUpdateRequestBody payload = {
        "children": [
            {
                "object": "block",
                "type": "heading_2",
                "heading_2": {
                    "rich_text": [{"type": "text", "text": {"content": "Test block"}}]
                }
            }
        ]
    };
    ChildBlockContent response = check notion->/v1/blocks/[testBlockId]/children.patch(payload);
    test:assertNotEquals(response, (), "Appended block children response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateDatabase() returns error? {
    DatabaseBodyParams payload = {
        "parent": {
            "type": "page_id",
            "page_id": testPageId
        },
        "icon": {
            "type": "emoji",
            "emoji": "📝"
        },
        "title": [
            {
                "type": "text",
                "text": {
                    "content": "Test Database",
                    "link": null
                }
            }
        ],
        "properties": {
            "Name": {
                "title": {}
            },
            "Description": {
                "rich_text": {}
            }
        }
    };
    DatabaseResponse_results response = check notion->/v1/databases.post(payload);
    test:assertNotEquals(response, (), "Created database response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreatePage() returns error? {
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
    test:assertNotEquals(response, (), "Created page response should not be null");
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testSearchPages() returns error? {
    record {} response = check notion->/v1/search.post(); 
    test:assertNotEquals(response, (), "Search pages response should not be null");
}