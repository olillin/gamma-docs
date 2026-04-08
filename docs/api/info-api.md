# Info API

Get detailed information about users and groups. Used by, for example,
[chalmers.it](https://chalmers.it) to get user and group information to display
on corresponding pages.

| Name           | Value                                                                                                                                                 |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| API Key Type   | `INFO`                                                                                                                                                |
| Base URL       | <https://auth.chalmers.it/api/info/v1>                                                                                                                |
| API Controller | [InfoV1ApiController](https://github.com/cthit/Gamma/blob/main/app/src/main/java/it/chalmers/gamma/adapter/primary/api/info/InfoV1ApiController.java) |

[TOC]

## Types

These are the types used in the Info API.

### User with Groups

```yaml
user: User
groups: GroupWithPost[]
```

??? example

    ```json
    {
      "user": {
        "cid": "janed",
        "nick": "Dough",
        "firstName": "Jane",
        "lastName": "Doe",
        "id": "2f63a363-af22-480d-be49-531c1831933c",
        "acceptanceYear": 2025
      },
      "groups": [
        {
          "group": {
            "id": "3cf94646-2412-4896-bba9-5d2410ac0c62",
            "version": 18,
            "name": "prit25",
            "prettyName": "P.R.I.T. 25",
            "superGroup": {
              "id": "32da51ec-2854-4bc2-b19a-30dad5dcc501",
              "version": 1,
              "name": "prit",
              "prettyName": "P.R.I.T.",
              "type": "committee",
              "svDescription": "PR och rustm\u00e4steri",
              "enDescription": "PR and premises maintenance"
            }
          },
          "post": {
            "id": "0b960919-6dc0-4128-b772-c31840b7b8f7",
            "version": 30,
            "svName": "MaterialChef",
            "enName": "MaterialChef",
            "emailPrefix": "material",
            "order": 11
          }
        }
      ]
    }
    ```

### User

```yaml
id: UserId
cid: string
nick: string
firstName: string
lastName: string
acceptanceYear: int
```

??? example

    ```json
    {
      "id": "2f63a363-af22-480d-be49-531c1831933c",
      "cid": "janed",
      "nick": "Dough",
      "firstName": "Jane",
      "lastName": "Doe",
      "acceptanceYear": 2025
    }
    ```

### Group with Post

```yaml
group:
  id: GroupId
  version: int
  name: string
  prettyName: string
  superGroup: SuperGroup
post:
  id: PostId
  version: int
  svName: string
  enName: string
  emailPrefix: string
  order: int
```

??? example

    ```json
    {
      "group": {
        "id": "7ec28eaa-7203-47fb-9c80-8b1678936be9",
        "version": 18,
        "name": "prit26",
        "prettyName": "P.R.I.T. 26",
        "superGroup": {
          "id": "32da51ec-2854-4bc2-b19a-30dad5dcc501",
          "name": "prit",
          "prettyName": "P.R.I.T.",
          "type": "committee",
          "svDescription": "PR och rustm\u00e4steri",
          "enDescription": "PR and premises maintenance"
        }
      },
      "post": {
        "id": "0b960919-6dc0-4128-b772-c31840b7b8f7",
        "version": 30,
        "svName": "MaterialChef",
        "enName": "MaterialChef",
        "emailPrefix": "material",
        "order": 11
      }
    }
    ```

### Super Group

```yaml
id: SuperGroupId
version: int
name: string
prettyName: string
type: "alumni" | "committee" | "functionaries" | "society"
svDescription: string
enDescription: string
```

??? example

    ```json
    {
      "id": "32da51ec-2854-4bc2-b19a-30dad5dcc501",
      "name": "prit",
      "prettyName": "P.R.I.T.",
      "type": "committee",
      "svDescription": "PR och rustm\u00e4steri",
      "enDescription": "PR and premises maintenance"
    }
    ```

### Blob

```yaml
type: "alumni" | "committee" | "functionaries" | "society"
superGroup: BlobSuperGroup[]
```

??? example

    ```json
    {
      "type": "committee",
      "superGroups": [
        {
          "superGroup": {
            "id": "32da51ec-2854-4bc2-b19a-30dad5dcc501",
            "name": "prit",
            "prettyName": "P.R.I.T.",
            "type": "committee",
            "svDescription": "PR och rustm\u00e4steri",
            "enDescription": "PR and premises maintenance"
          },
          "hasBanner": true,
          "hasAvatar": true,
          "members": [
            {
              "user": {
                "id": "2f63a363-af22-480d-be49-531c1831933c",
                "cid": "bloggsj",
                "nick": "Bloggan",
                "firstName": "Johnny",
                "lastName": "Bloggs",
                "acceptanceYear": 2025
              },
              "post": {
                "id": "2a1a66a2-8e58-461c-96f1-9408a9c543f9",
                "svName": "Medlem",
                "enName": "Member",
                "emailPrefix": ""
              },
              "unofficialPostName": "MatChef"
            },
            {
              "user": {
                "cid": "janed",
                "nick": "Dough",
                "firstName": "Jane",
                "lastName": "Doe",
                "id": "2f63a363-af22-480d-be49-531c1831933c",
                "acceptanceYear": 2025
              },
              "post": {
                "id": "0b960919-6dc0-4128-b772-c31840b7b8f7",
                "svName": "MaterialChef",
                "enName": "MaterialChef",
                "emailPrefix": "material"
              },
              "unofficialPostName": ""
            }
          ]
        }
      ]
    }
    ```

### Blob Super Group

```yaml
superGroup:
    id: SuperGroupId
    name: string
    prettyName: string
    type: "alumni" | "committee" | "functionaries" | "society"
    svDescription: string
    enDescription: string
hasBanner: boolean
hasAvatar: boolean
members: BlobMember[]
```

??? example

    ```json
    {
      "superGroup": {
        "id": "32da51ec-2854-4bc2-b19a-30dad5dcc501",
        "name": "prit",
        "prettyName": "P.R.I.T.",
        "type": "committee",
        "svDescription": "PR och rustm\u00e4steri",
        "enDescription": "PR and premises maintenance"
      },
      "hasBanner": true,
      "hasAvatar": true,
      "members": [
        {
          "user": {
            "id": "2f63a363-af22-480d-be49-531c1831933c",
            "cid": "bloggsj",
            "nick": "Bloggan",
            "firstName": "Johnny",
            "lastName": "Bloggs",
            "acceptanceYear": 2025
          },
          "post": {
            "id": "2a1a66a2-8e58-461c-96f1-9408a9c543f9",
            "svName": "Medlem",
            "enName": "Member",
            "emailPrefix": ""
          },
          "unofficialPostName": "MatChef"
        },
        {
          "user": {
            "cid": "janed",
            "nick": "Dough",
            "firstName": "Jane",
            "lastName": "Doe",
            "id": "2f63a363-af22-480d-be49-531c1831933c",
            "acceptanceYear": 2025
          },
          "post": {
            "id": "0b960919-6dc0-4128-b772-c31840b7b8f7",
            "svName": "MaterialChef",
            "enName": "MaterialChef",
            "emailPrefix": "material"
          },
          "unofficialPostName": ""
        }
      ]
    }
    ```

### Blob Member

```yaml
user: User
post:
    id: PostId
    svName: string
    enName: string
    emailPrefix: string
unofficialPostName: string
```

??? example

    ```json
    {
      "user": {
        "id": "2f63a363-af22-480d-be49-531c1831933c",
        "cid": "bloggsj",
        "nick": "Bloggan",
        "firstName": "Johnny",
        "lastName": "Bloggs",
        "acceptanceYear": 2025
      },
      "post": {
        "id": "2a1a66a2-8e58-461c-96f1-9408a9c543f9",
        "svName": "Medlem",
        "enName": "Member",
        "emailPrefix": ""
      },
      "unofficialPostName": "MatChef"
    }
    ```

## Endpoints Reference

The Info API is currently hosted at <https://auth.chalmers.it/api/info/v1> and
all endpoints in this section are relative to this URL.

### GET /users/{id}

Get information about a specific user.

**Return type**: [User with Groups](#user-with-groups)

#### Parameters

| Name | Type | Data Type | Description   |     |
| ---- | ---- | --------- | ------------- | --- |
| id   | path | UserId    | The user UUID |     |

#### Example

??? example "Click to show example request and response"

    #### Request

    `GET /users/2f63a363-af22-480d-be49-531c1831933c`

    #### Response

    ```json
    {
      "user": {
        "cid": "janed",
        "nick": "Dough",
        "firstName": "Jane",
        "lastName": "Doe",
        "id": "2f63a363-af22-480d-be49-531c1831933c",
        "acceptanceYear": 2025
      },
      "groups": [
        {
          "group": {
            "id": "3cf94646-2412-4896-bba9-5d2410ac0c62",
            "name": "prit25",
            "prettyName": "P.R.I.T. 25",
            "superGroup": {
              "id": "32da51ec-2854-4bc2-b19a-30dad5dcc501",
              "version": 1,
              "name": "prit",
              "prettyName": "P.R.I.T.",
              "type": "committee",
              "svDescription": "PR och rustm\u00e4steri",
              "enDescription": "PR and premises maintenance"
            },
            "version": 18
          },
          "post": {
            "id": "0b960919-6dc0-4128-b772-c31840b7b8f7",
            "version": 30,
            "svName": "MaterialChef",
            "enName": "MaterialChef",
            "emailPrefix": "material",
            "order": 11
          }
        }
      ]
    }
    ```

### GET /blob

Get the full detailed information about all super groups.

**Return type**: [Blob](#blob) list

#### Example

??? example "Click to show example request and response"

    #### Request

    `GET /blob`

    #### Response

    ```json
    [
      {
        "type": "alumni",
        "superGroups": []
      },
      {
        "type": "committee",
        "superGroups": [
          {
            "superGroup": {
              "id": "32da51ec-2854-4bc2-b19a-30dad5dcc501",
              "name": "prit",
              "prettyName": "P.R.I.T.",
              "type": "committee",
              "svDescription": "PR och rustm\u00e4steri",
              "enDescription": "PR and premises maintenance"
            },
            "hasBanner": true,
            "hasAvatar": true,
            "members": [
              {
                "user": {
                  "id": "2f63a363-af22-480d-be49-531c1831933c",
                  "cid": "bloggsj",
                  "nick": "Bloggan",
                  "firstName": "Johnny",
                  "lastName": "Bloggs",
                  "acceptanceYear": 2025
                },
                "post": {
                  "id": "2a1a66a2-8e58-461c-96f1-9408a9c543f9",
                  "svName": "Medlem",
                  "enName": "Member",
                  "emailPrefix": ""
                },
                "unofficialPostName": "MatChef"
              },
              {
                "user": {
                  "cid": "janed",
                  "nick": "Dough",
                  "firstName": "Jane",
                  "lastName": "Doe",
                  "id": "2f63a363-af22-480d-be49-531c1831933c",
                  "acceptanceYear": 2025
                },
                "post": {
                  "id": "0b960919-6dc0-4128-b772-c31840b7b8f7",
                  "svName": "MaterialChef",
                  "enName": "MaterialChef",
                  "emailPrefix": "material"
                },
                "unofficialPostName": ""
              }
            ]
          }
        ]
      },
      {
        "type": "functionaries",
        "superGroups": []
      },
      {
        "type": "society",
        "superGroups": []
      }
    ]
    ```
