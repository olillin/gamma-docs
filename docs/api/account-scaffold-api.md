# Account Scaffold API

Used by, for example, [cthit/SyncIT](https://github.com/cthit/SyncIT) to sync
external accounts like GSuite and Bitwarden with Gamma.

| Name           | Value                                                                                                                                                                                  |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| API Key Type   | `ACCOUNT_SCAFFOLD`                                                                                                                                                                     |
| API Controller | [AccountScaffoldV1ApiController](https://github.com/cthit/Gamma/blob/main/app/src/main/java/it/chalmers/gamma/adapter/primary/api/accountscaffold/AccountScaffoldV1ApiController.java) |

[TOC]

## Types

### User

```yaml
email: string
cid: string
nick: string
firstName: string
lastName: string
```

<details>
<summary>Example</summary>

```json
{
  "email": "janed@chalmers.se",
  "cid": "janed",
  "nick": "Dough",
  "firstName": "Jane",
  "lastName": "Doe"
}
```

</details>

### Super group

```yaml
name: string
prettyName: string
type: "alumni" | "committee" | "functionaries" | "society"
useManagedAccount: boolean
groups: Group[]
```

<details>
<summary>Example</summary>

```json
{
  "name": "prit",
  "prettyName": "P.R.I.T.",
  "type": "committee",
  "useManagedAccount": true,
  "groups": [
    {
      "name": "prit25",
      "prettyName": "P.R.I.T. 25",
      "members": [
        {
          "user": {
            "cid": "smithj",
            "nick": "Smithed",
            "firstName": "John",
            "lastName": "Smith",
            "email": "smithj@chalmers.se"
          },
          "post": {
            "postId": "3eea59d7-eaf6-498c-b43d-a315c13fac55",
            "svText": "Ordf\u00f6rande",
            "enText": "Chairman",
            "emailPrefix": "ordf"
          }
        },
        {
          "user": {
            "cid": "janed",
            "nick": "Dough",
            "firstName": "Jane",
            "lastName": "Doe",
            "email": "janed@chalmers.se"
          },
          "post": {
            "postId": "0b960919-6dc0-4128-b772-c31840b7b8f7",
            "svText": "MaterialChef",
            "enText": "MaterialChef",
            "emailPrefix": "material"
          }
        }
      ]
    }
  ]
}
```

</details>

### Group

```yaml
name: string
prettyName: string
members: UserPost[]
```

<details>
<summary>Example</summary>

```json
{
  "name": "prit25",
  "prettyName": "P.R.I.T. 25",
  "members": [
    {
      "user": {
        "cid": "smithj",
        "nick": "Smithed",
        "firstName": "John",
        "lastName": "Smith",
        "email": "smithj@chalmers.se"
      },
      "post": {
        "postId": "3eea59d7-eaf6-498c-b43d-a315c13fac55",
        "svText": "Ordf\u00f6rande",
        "enText": "Chairman",
        "emailPrefix": "ordf"
      }
    },
    {
      "user": {
        "cid": "janed",
        "nick": "Dough",
        "firstName": "Jane",
        "lastName": "Doe",
        "email": "janed@chalmers.se"
      },
      "post": {
        "postId": "0b960919-6dc0-4128-b772-c31840b7b8f7",
        "svText": "MaterialChef",
        "enText": "MaterialChef",
        "emailPrefix": "material"
      }
    }
  ]
}
```

</details>

### User post

```yaml
user: User
post: Post
```

<details>
<summary>Example</summary>

```json
{
  "user": {
    "cid": "smithj",
    "nick": "Smithed",
    "firstName": "John",
    "lastName": "Smith",
    "email": "smithj@chalmers.se"
  },
  "post": {
    "postId": "3eea59d7-eaf6-498c-b43d-a315c13fac55",
    "svText": "Ordf\u00f6rande",
    "enText": "Chairman",
    "emailPrefix": "ordf"
  }
}
```

</details>

### Post

```yaml
postId: UUID
svText: string
enText: string
emailPrefix: string
```

<details>
<summary>Example</summary>

```json
{
  "postId": "3eea59d7-eaf6-498c-b43d-a315c13fac55",
  "svText": "Ordf\u00f6rande",
  "enText": "Chairman",
  "emailPrefix": "ordf"
}
```

</details>

## Endpoints Reference

The client API is currently hosted at
<https://auth.chalmers.it/api/account-scaffold/v1> and all endpoints in this
section are relative to this URL.

### GET /users

Get all active users, i.e. users in a "managed" group and who have completed
GDPR training.

**Return type**: [User](#user) list

#### Example

Request: `GET /users`

<details>
<summary>Response</summary>

```json
[
  {
    "email": "smithj@chalmers.se",
    "cid": "smithj",
    "nick": "Smithed",
    "firstName": "John",
    "lastName": "Smith"
  },
  {
    "email": "janed@chalmers.se",
    "cid": "janed",
    "nick": "Dough",
    "firstName": "Jane",
    "lastName": "Doe"
  }
]
```

</details>

### GET /supergroups

Get all active super groups, i.e. super groups belonging to any of the active
super group types configured in Gamma's settings. Only users who have completed
GDPR training will be included in the result. In addition, super groups with no
valid groups in them will be omitted.

**Return type**: [Super group](#super-group) list

#### Example

Request: `GET /supergroups`

<details>
<summary>Response</summary>

```json
[
  {
    "name": "prit",
    "prettyName": "P.R.I.T.",
    "type": "committee",
    "useManagedAccount": true,
    "groups": [
      {
        "name": "prit25",
        "prettyName": "P.R.I.T. 25",
        "members": [
          {
            "user": {
              "cid": "smithj",
              "nick": "Smithed",
              "firstName": "John",
              "lastName": "Smith",
              "email": "smithj@chalmers.se"
            },
            "post": {
              "postId": "3eea59d7-eaf6-498c-b43d-a315c13fac55",
              "svText": "Ordf\u00f6rande",
              "enText": "Chairman",
              "emailPrefix": "ordf"
            }
          },
          {
            "user": {
              "cid": "janed",
              "nick": "Dough",
              "firstName": "Jane",
              "lastName": "Doe",
              "email": "janed@chalmers.se"
            },
            "post": {
              "postId": "0b960919-6dc0-4128-b772-c31840b7b8f7",
              "svText": "MaterialChef",
              "enText": "MaterialChef",
              "emailPrefix": "material"
            }
          }
        ]
      }
    ]
  }
]
```

</details>
