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

import ballerina/http;
import ballerina/log;

listener http:Listener httpListener = new (9090);

http:Service mockService = service object { 
    # Retrieve block children
    #
    # + id - block children ID
    # + page_size - Page size
    # + Notion\-Version - API Version
    # + return - 200 Success - Retrieve block children 
    resource function get v1/blocks/[string id]/children(string? page_size, @http:Header string? Notion\-Version = "2022-06-28") returns BlockChildrenResponse {
        return {
            "object": "list",
            "results": [],
            "next_cursor": null,
            "has_more": false
        };
    }

    # Retrieve a database
    #
    # + id - Database ID
    # + Notion\-Version - API Version
    # + return - 200 Success - Retrieve a database 
    resource function get v1/databases/[string id](@http:Header string? Notion\-Version = "2022-06-28") returns Database {
        return {
            "object": "database",
            "id": id,
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z",
            "title": [],
            "properties": {}
        };
    }

    # Retrieve a Page
    #
    # + id - Page ID
    # + Notion\-Version - API Version
    # + return - 200 Success - Retrieve a Page 
    resource function get v1/pages/[string id](@http:Header string? Notion\-Version = "2022-06-28") returns PageResponse {
        return {
            "object": "page",
            "id": id,
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z",
            "archived": false,
            "properties": {}
        };
    }

    # List all users
    #
    # + start_cursor - If supplied, this endpoint will return a page of results starting after the cursor provided. If not supplied, this endpoint will return the first page of results.
    # + page_size - The number of items from the full list desired in the response. Maximum- 100
    # + Notion\-Version - API Version
    # + return - 200 Success - List all users 
    resource function get v1/users(string? start_cursor, int? page_size, @http:Header string? Notion\-Version = "2022-06-28") returns PaginatedUsers {
        return {
            "object": "list",
            "results": [],
            "next_cursor": null,
            "has_more": false
        };
    }

    # Retrieve a user
    #
    # + id - User ID
    # + Notion\-Version - API Version
    # + return - 200 Success - Retrieve a user 
    resource function get v1/users/[string id](@http:Header string? Notion\-Version = "2022-06-28") returns User {
        return {
            "object": "user",
            "id": id,
            "name": "Test User",
            "type": "person"
        };
    }

    # Append block children
    #
    # + id - block children ID
    # + Notion\-Version - API Version
    # + return - 200 Success - Append block children 
    resource function patch v1/blocks/[string id]/children(@http:Payload PageUpdateRequestBody payload, @http:Header string? Notion\-Version = "2022-06-28") returns ChildBlockContent {
        return {
            "object": "block",
            "id": id,
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z",
            "has_children": false,
            "type": "paragraph"
        };
    }

    # List all databases
    #
    # + Notion\-Version - API Version
    # + return - 200 Success - List all databases 
    resource function post v1/databases(@http:Payload DatabaseBodyParams payload, @http:Header string? Notion\-Version = "2022-06-28") returns DatabaseResponse {
        return {
            "archived": false,
            "created_time": "2023-01-01T00:00:00.000Z",
            "id": "test_database_id",
            "last_edited_time": "2023-01-01T00:00:00.000Z"
        };
    }

    # Create a page
    #
    # + Notion\-Version - API Version
    # + payload - Page information 
    # + return - 200 Success - Create Page 
    resource function post v1/pages(@http:Payload PageBodyParams payload, @http:Header string? Notion\-Version = "2022-06-28") returns PageResponse {
        return {
            "archived": false,
            "id": "test_page_id",
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z"
        };
    }
    
    # Searches all pages and child pages
    #
    # + Notion\-Version - API Version
    # + return - 200 Success - List all user 
    resource function post v1/search(@http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "list",
            "results": [],
            "next_cursor": null,
            "has_more": false
        };
    }
};

function init() returns error? {
    if isLiveServer {
        log:printInfo("Skipping mock server initialization as the tests are running on live server");
        return;
    }
    log:printInfo("Initiating mock server");
    check httpListener.attach(mockService, "/");
    check httpListener.'start();
}