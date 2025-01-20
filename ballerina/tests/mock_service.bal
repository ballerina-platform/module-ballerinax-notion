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
    # Delete a block
    # + id - Block ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function delete v1/blocks/[string id](@http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "block",
            "id": id
        };
    }

    # Retrieve a block
    # + id - Block ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function get v1/blocks/[string id](@http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "block",
            "id": id,
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z",
            "has_children": false,
            "type": "paragraph"
        };
    }

    # Retrieve block children
    # + id - Block ID
    # + page_size - Page size
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function get v1/blocks/[string id]/children(int? page_size = (), @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "list",
            "results": [],
            "next_cursor": null,
            "has_more": false
        };
    }

    # Retrieve comments
    # + block_id - Block ID
    # + page_size - Page size
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function get v1/comments(string? block_id = (), int? page_size = (), @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "list",
            "results": [],
            "next_cursor": null,
            "has_more": false
        };
    }

    # Retrieve a database
    # + id - Database ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function get v1/databases/[string id](@http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "database",
            "id": id,
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z",
            "title": [],
            "properties": {}
        };
    }

    # Retrieve a page
    # + id - Page ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function get v1/pages/[string id](@http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "page",
            "id": id,
            "created_time": "2023-01-01T00:00:00.000Z",
            "last_edited_time": "2023-01-01T00:00:00.000Z",
            "archived": false,
            "properties": {}
        };
    }

    # Retrieve a page property
    # + pageId - Page ID
    # + propertyId - Property ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function get v1/pages/[string pageId]/properties/[string propertyId](@http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "property_item",
            "id": propertyId,
            "type": "title"
        };
    }

    # List all users
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function get v1/users(@http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "list",
            "results": [],
            "next_cursor": null,
            "has_more": false
        };
    }

    # Retrieve bot user
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function get v1/users/me(@http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "user",
            "id": "test_bot_id",
            "name": "Test Bot",
            "type": "bot"
        };
    }

    # Retrieve a user
    # + id - User ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function get v1/users/[string id](@http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "user",
            "id": id,
            "name": "Test User",
            "type": "person"
        };
    }

    # Update block
    # + id - Block ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function patch v1/blocks/[string id](@http:Payload record {} payload, @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "block",
            "id": id,
            "type": "paragraph"
        };
    }

    # Append block children
    # + id - Block ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function patch v1/blocks/[string id]/children(@http:Payload record {} payload, @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "block",
            "id": id,
            "has_children": true
        };
    }

    # Update database
    # + id - Database ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function patch v1/databases/[string id](@http:Payload record {} payload, @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "database",
            "id": id
        };
    }

    # Update page
    # + id - Page ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function patch v1/pages/[string id](@http:Payload record {} payload, @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "page",
            "id": id
        };
    }

    # Create comment
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function post v1/comments(@http:Payload record {} payload, @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "comment",
            "id": "test_comment_id"
        };
    }

    # Create database
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function post v1/databases(@http:Payload record {} payload, @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "database",
            "id": "test_database_id"
        };
    }

    # Query database
    # + id - Database ID
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function post v1/databases/[string id]/query(@http:Payload record {} payload, @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "list",
            "results": [],
            "next_cursor": null,
            "has_more": false
        };
    }

    # Create page
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function post v1/pages(@http:Payload record {} payload, @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
        return {
            "object": "page",
            "id": "test_page_id"
        };
    }

    # Search
    # + Notion\-Version - API Version
    # + return - 200 Success
    resource function post v1/search(@http:Payload record {} payload, @http:Header string? Notion\-Version = "2022-06-28") returns record {} {
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
