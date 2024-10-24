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
import ballerina/os;
import ballerinax/notion;

configurable string authToken = os:getEnv("NOTION_AUTH_TOKEN"); 

// Initialize the client with your notion authentication token
final notion:Client notion = check new notion:Client(
    config = {
        auth: {
            token: authToken
        }
    }
);

public function main() returns error? { 
    notion:PaginatedUsers|error result = check notion->/v1/users.get(); 

    if result is error {
        io:println("Error retrieving users list: ", result.message());
    } else {
        io:println("Users list retrieved successfully:");
        io:println(result.toString());
    }
}
