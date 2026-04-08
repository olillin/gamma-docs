# Introduction

The "Gamma API" actually consists of 4 APIs with their own use cases:

- [Client API](client-api.md) for logging in users to a service.
- [Info API](info-api.md) for fetching information without a logged in user.
- [Allow List API](allow-list-api.md) for managing the allow list.
- [Account Scaffold API](account-scaffold-api.md) for syncing external accounts
    with Gamma.

See the more details about the different APIs in their respective documents.

## Responses

Successful responses from the Gamma API are returned as
[JSON](https://www.w3schools.com/whatis/whatis_json.asp) with a `200 OK` status
code.

### Errors

Gamma provides very limited information when an error occurs, most of the time
it will not even return an error status code. Most errors, such as authorization
errors or requesting resources that do not exist, will instead redirect the
request to the login page at <https://auth.chalmers.it/login>. Therefore the
simplest method of catching errors is to check if the `Content-Type` header
includes `text/html`, since the returned page is not JSON.

## Types

This document uses
[semantic types](https://github.com/MartinJohns/SemanticTypes) to define aliases
which provide more meaning about where the type should be used.

This is most notably used with IDs: Gamma uses version 4 UUIDs for IDs but
multiple aliases are used depending on what the identifier is for. For example,
the Client API endpoint `GET /users/{id}` expects a UUID that identifies a user,
so the type `UserId` is used.

Below are the aliases used in this document:

```yaml
UserId: UUID
GroupId: UUID
SuperGroupId: UUID
PostId: UUID

Timestamp: int # Unix time stamp in seconds format
```

## Further Reading

- [Authorization](authorization.md)
