import ballerina/io;
import ballerinax/notion;
import ballerinax/os;

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

    if result is error {
        io:println("Error retrieving page: ", result.message());
    } else {
        io:println("Page retrieved successfully:");
        io:println(result.toString());
    }
}
