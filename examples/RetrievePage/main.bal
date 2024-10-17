import ballerina/io;
import ballerinax/notion;
 
configurable string authToken = os:getEnv("NOTION_AUTH_TOKEN");
configurable string testPageId = "xyz";


// Initialize the client with your notion authentication token
notion:ConnectionConfig config = {
    auth: {
        token: authToken
    }
};
final notion:Client notion = check new (config);

public function main() returns error? {
    PageResponse result = check notion->/v1/pages/[testPageId];

    if result is error {
        io:println("Error retrieving page: ", result.message());
    } else {
        io:println("Page retrieved successfully:");
        io:println(result.toString());
    }
}