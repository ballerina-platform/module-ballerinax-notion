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
configurable string testBlockId = "xyz";

// Initialize the client with your notion authentication token
final notion:Client notion = check new notion:Client(
    config = {
        auth: {
            token: authToken
        }
    }
);

public function main() returns error? {
    notion:PageUpdateRequestBody payload = {
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
    notion:ChildBlockContent|error result = check notion->/v1/blocks/[testBlockId]/children.patch(payload);

    if result is error {
        io:println("Error appending to block: ", result.message());
    } else {
        io:println("Appended to block successfully:");
        io:println(result.toString());
    }
}
