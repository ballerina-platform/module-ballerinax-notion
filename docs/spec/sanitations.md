_Author_: Jaagrav Seal  
_Created_: 17-10-2024  
_Updated_: 17-10-2024  
_Edition_: Swan Lake

## Overview

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

- Change the `record {}` type responses to appropriate record types. The following types have been newly generated with the correct fields:
    - BlockResponse
    - BlockChildrenResponse
    - CommentResponse
    - PageResponse
    - Database
    - RollupListPropertyItem
    - PropertyItemResult
    - NumberPropertyItem
    - PaginatedUsers
    - DatabasePatchRequest
    - ArchivePageRequest
    - PageUpdatedProperties
    - CreateDatabaseRequest
    - CreateDatabaseResponse
    - PageResponse
    - SearchRequest
    - SearchResponse

## OpenAPI CLI Command

```bash
$ bal openapi -i docs/spec/openapi.yml --mode client --license docs/license.txt -o ballerina
```

Note: The license year is hardcoded to 2025. Please update it if necessary.
