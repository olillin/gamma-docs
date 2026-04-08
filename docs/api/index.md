# The Gamma API

"The Gamma API" actually consists of 4 APIs with different purposes:

- [Client API](client-api.md) for users logged in to a client.
- [Info API](info-api.md) to get data as a client without a user.
- [Allow List API](allow-list-api.md) for managing the allow list.
- [Account Scaffold API](account-scaffold-api.md)

See the more details about the different APIs in their respective documents.

## API Responses

### Successful responses

Successful responses from the Gamma API are returned in
[JSON](https://www.w3schools.com/whatis/whatis_json.asp) format.

### Unsuccessful responses

Most unsuccessful responses (like authorization errors or requesting resources
that don't exist) will redirect you to the Gamma login page at
<https://auth.chalmers.it/login>. To catch this you can check if the response
header `Content-Type` includes `text/html`, since the returned page is not JSON.

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
