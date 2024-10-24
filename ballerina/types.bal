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

public type User record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

# Represents the Headers record for the operation: searchPages
public type SearchPagesHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

public type DatabaseResponse record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

public type PageUpdatedProperties record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

public type PaginatedUsers record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

public type PageBodyParams record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

public type PageUpdateRequestBody record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

# Represents the Headers record for the operation: queryDatabase
public type QueryDatabaseHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

public type PageContent record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

public type ChildBlockContent record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

# Represents the Headers record for the operation: listAllUsers
public type ListAllUsersHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

public type BlockChildrenResponse record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

# Represents the Queries record for the operation: listAllUsers
public type ListAllUsersQueries record {
    # If supplied, this endpoint will return a page of results starting after the cursor provided. If not supplied, this endpoint will return the first page of results.
    string start_cursor?;
    # The number of items from the full list desired in the response. Maximum- 100
    int page_size?;
};

public type Database record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

public type PageResponse record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Represents the Headers record for the operation: retrieveUser
public type RetrieveUserHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

public type DatabaseBodyParams record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

public type BlockContent record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

# Represents the Headers record for the operation: retrieveDatabase
public type RetrieveDatabaseHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Represents the Headers record for the operation: retrievePage
public type RetrievePageHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Represents the Headers record for the operation: updatePageProperties
public type UpdatePagePropertiesHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Represents the Queries record for the operation: retrieveBlockChildren
public type RetrieveBlockChildrenQueries record {
    # Page size
    string page_size?;
};

# Represents the Headers record for the operation: retrieveBlockChildren
public type RetrieveBlockChildrenHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Represents the Headers record for the operation: listAllDatabases
public type ListAllDatabasesHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

public type DatabaseContent record {
    # block objects
    BlockContent[] text?;
    # Any nested children blocks
    BlockContent[] children?;
    # Whether the to_do is checked or not
    boolean checked?;
    # Content of a block element
    string content?;
};

# Represents the Headers record for the operation: createDatabase
public type CreateDatabaseHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Represents the Queries record for the operation: listAllDatabases
public type ListAllDatabasesQueries record {
    # If supplied, this endpoint will return a page of results starting after the cursor provided. If not supplied, this endpoint will return the first page of results.
    string start_cursor?;
    # The number of items from the full list desired in the response. Maximum- 100
    int page_size?;
};

# Represents the Headers record for the operation: createPage
public type CreatePageHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};

# Represents the Headers record for the operation: appendBlockChildren
public type AppendBlockChildrenHeaders record {
    # API Version
    string? Notion\-Version = "2022-06-28";
};
