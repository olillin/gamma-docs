# Allow List API

Manage the Gamma [allow list](#what-is-the-allow-list).

| Name           | Value                                                                                                                                                                |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| API Key Type   | `ALLOW_LIST`                                                                                                                                                         |
| Base URL       | <https://auth.chalmers.it/api/allow-list/v1>                                                                                                                         |
| API Controller | [AllowListV1ApiController](https://github.com/cthit/Gamma/blob/main/app/src/main/java/it/chalmers/gamma/adapter/primary/api/allowlist/AllowListV1ApiController.java) |

[TOC]

## What is the allow list?

The allow list is a whitelist of **cid**s (Chalmers IDs) which are allowed to
create a Gamma account. This is to limit Gamma account creation to members of
the Software Engineering Student Division (IT).

When a new year of students enroll at the Software Engineering programme their
cids are added to the allow list and they are allowed to create Gamma accounts.

## Types

These are the types used in the Allow List API.

### Success Response

```yaml
name: string # Class name of the response
code: int # HTTP status code
```

??? example

    ```json
    {
      "name": "ALLOW_LIST_ADDED_RESPONSE",
      "code": 200
    }
    ```

## Endpoints Reference

The Allow List API is currently hosted at
<https://auth.chalmers.it/api/allow-list/v1> and all endpoints in this section
are relative to this URL.

### GET /

Get the list of CIDs in the allow list.

**Return type**: String list

#### Example

??? example "Click to show example request and response"

    #### Request

    `GET /`

    #### Response

    ```json
    [
      "janed",
      "smithj"
    ]
    ```

### POST /

Add users to the allow list.

**Return type**: [Success Response](#success-response)

#### Body

The request body is a list of the CIDs to add to the allow list.

??? example

    ```json
    [
      "smithj",
      "bloggsj"
    ]
    ```

#### Errors

???+ failure "206 Partial Content — Failed to add some users"

    One or more users could not be added to the allow list. The CIDs of the users
    who failed to be added are returned in the response body.

    **Response type**: String list

#### Example

??? example "Click to show example request and response"

    #### Request

    `POST /`

    Request body:

    ```json
    [
      "smithj",
      "bloggsj"
    ]
    ```

    #### Response (Success)

    ```json
    {
      "name": "ALLOW_LIST_ADDED_RESPONSE",
      "code": 200
    }
    ```

    #### Response (Failed)

    HTTP status code: `206 Partial Content`

    ```json
    [
      "smithj"
    ]
    ```
