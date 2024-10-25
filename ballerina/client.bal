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

# This is a generated connector for [Notion API v1](https://developers.notion.com/reference/intro) OpenAPI Specification. 
# Notion API provides capability to access all-in-one workspace where you can write, plan, collaborate and get organized. it has components such as notes, databases, kanban boards, wikis, calendars, and reminders. You can connect these  components to take notes, add tasks, manage projects & more. Notion provides the building blocks and you can  create your own layouts and toolkit to get work done. This ballerina connector allows you to connect Notion through its [REST API](https://developers.notion.com/docs).
@display {label: "Notion", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Notion account](https://www.notion.so/)  and obtain tokens following [this guide](https://developers.notion.com/docs/authorization).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.notion.com") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    # Retrieve block children
    #
    # + id - block children ID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - 200 Success - Retrieve block children 
    resource isolated function get v1/blocks/[string id]/children(RetrieveBlockChildrenHeaders headers = {}, *RetrieveBlockChildrenQueries queries) returns BlockChildrenResponse|error {
        string resourcePath = string `/v1/blocks/${getEncodedUri(id)}/children`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # List all databases
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - 200 Success - List all databases 
    resource isolated function get v1/databases(ListAllDatabasesHeaders headers = {}, *ListAllDatabasesQueries queries) returns DatabaseResponse|error {
        string resourcePath = string `/v1/databases`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Retrieve a database
    #
    # + id - Database ID
    # + headers - Headers to be sent with the request 
    # + return - 200 Success - Retrieve a database 
    resource isolated function get v1/databases/[string id](RetrieveDatabaseHeaders headers = {}) returns Database|error {
        string resourcePath = string `/v1/databases/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Retrieve a Page
    #
    # + id - Page ID
    # + headers - Headers to be sent with the request 
    # + return - 200 Success - Retrieve a Page 
    resource isolated function get v1/pages/[string id](RetrievePageHeaders headers = {}) returns PageResponse|error {
        string resourcePath = string `/v1/pages/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # List all users
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - 200 Success - List all users 
    resource isolated function get v1/users(ListAllUsersHeaders headers = {}, *ListAllUsersQueries queries) returns PaginatedUsers|error {
        string resourcePath = string `/v1/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Retrieve a user
    #
    # + id - User ID
    # + headers - Headers to be sent with the request 
    # + return - 200 Success - Retrieve a user 
    resource isolated function get v1/users/[string id](RetrieveUserHeaders headers = {}) returns User|error {
        string resourcePath = string `/v1/users/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Append block children
    #
    # + id - block children ID
    # + headers - Headers to be sent with the request 
    # + return - 200 Success - Append block children 
    resource isolated function patch v1/blocks/[string id]/children(PageUpdateRequestBody payload, AppendBlockChildrenHeaders headers = {}) returns ChildBlockContent|error {
        string resourcePath = string `/v1/blocks/${getEncodedUri(id)}/children`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, httpHeaders);
    }

    # Update Page properties 
    #
    # + id - Page ID
    # + headers - Headers to be sent with the request 
    # + return - 200 Success - Update Page properties 
    resource isolated function patch v1/pages/[string id](PageContent payload, UpdatePagePropertiesHeaders headers = {}) returns PageUpdatedProperties|error {
        string resourcePath = string `/v1/pages/${getEncodedUri(id)}`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, httpHeaders);
    }

    # Create a database
    #
    # + headers - Headers to be sent with the request 
    # + payload - Page information 
    # + return - 200 Success - Create a database 
    resource isolated function post v1/databases(DatabaseBodyParams payload, CreateDatabaseHeaders headers = {}) returns DatabaseBodyParams|error {
        string resourcePath = string `/v1/databases`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Query a Database
    #
    # + id - Database ID
    # + headers - Headers to be sent with the request 
    # + return - 200 Success - Query a Database (Single Filter) 
    resource isolated function post v1/databases/[string id]/query(DatabaseContent payload, QueryDatabaseHeaders headers = {}) returns DatabaseResponse|error {
        string resourcePath = string `/v1/databases/${getEncodedUri(id)}/query`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Create a page
    #
    # + headers - Headers to be sent with the request 
    # + payload - Page information 
    # + return - 200 Success - Create Page 
    resource isolated function post v1/pages(PageBodyParams payload, CreatePageHeaders headers = {}) returns PageResponse|error {
        string resourcePath = string `/v1/pages`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Searches all pages and child pages
    #
    # + headers - Headers to be sent with the request 
    # + return - 200 Success - List all user 
    resource isolated function post v1/search(SearchPagesHeaders headers = {}) returns record {}|error {
        string resourcePath = string `/v1/search`;
        map<string|string[]> httpHeaders = getMapForHeaders(headers);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }
}
