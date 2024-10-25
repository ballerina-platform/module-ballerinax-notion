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

import ballerina/io;
import ballerinax/notion;
import ballerinax/os;

configurable string authToken = os:getEnv("NOTION_AUTH_TOKEN");
configurable string testPageId = "xyz";

// Initialize the client with your notion authentication token
final notion:Client notion = check new notion:Client(
    config = {
        auth: {
            token: authToken
        }
    }
);

public function main() returns error? {
    notion:PageBodyParams payload = {
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
    notion:PageResponse|error result = check notion->/v1/pages.post(payload);

    if result is error {
        io:println("Error creating page: ", result.message());
    } else {
        io:println("Page created successfully:");
        io:println(result.toString());
    }
}
