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
    resource function get v1/blocks/[string id]/children(string? page_size, @http:Header string? notion\-version = "2021-05-13") returns BlockChildrenResponse {
        return {
            "object": "list",
            "results": [],
            "next_cursor": null,
            "has_more": false
        };
    }

    resource function get v1/databases/[string id](@http:Header string? notion\-version = "2021-05-13") returns Database {
        return {
            "object": "database",
            "id": id,
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z",
            "title": [],
            "properties": {}
        };
    }

    resource function get v1/pages/[string id](@http:Header string? notion\-version = "2021-05-13") returns PageResponse {
        return {
            "object": "page",
            "id": id,
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z",
            "archived": false,
            "properties": {}
        };
    }

    resource function get v1/users(string? start_cursor, int? page_size, @http:Header string? notion\-version = "2021-05-13") returns PaginatedUsers {
        return {
            "object": "list",
            "results": [],
            "next_cursor": null,
            "has_more": false
        };
    }

    resource function get v1/users/[string id](@http:Header string? notion\-version = "2021-05-13") returns User {
        return {
            "object": "user",
            "id": id,
            "name": "Test User",
            "type": "person"
        };
    }

    resource function patch v1/blocks/[string id]/children(@http:Payload PageUpdateRequestBody payload, @http:Header string? notion\-version = "2021-05-13") returns ChildBlockContent {
        return {
            "object": "block",
            "id": id,
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z",
            "has_children": false,
            "type": "paragraph"
        };
    }

    resource function post v1/databases(@http:Payload DatabaseBodyParams payload, @http:Header string? notion\-version = "2021-05-13") returns DatabaseResponse_results {
        return {
            "archived": false,
            "created_time": "2023-01-01T00:00:00.000Z",
            "id": "test_database_id",
            "last_edited_time": "2023-01-01T00:00:00.000Z"
        };
    }

    resource function post v1/pages(@http:Payload PageBodyParams payload, @http:Header string? notion\-version = "2021-05-13") returns PageResponse {
        return {
            "archived": false,
            "id": "test_page_id",
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z"
        };
    }

    resource function post v1/search(@http:Header string? notion\-version = "2021-05-13") returns record {} {
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