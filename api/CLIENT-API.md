# Client API Reference

**API Key Type**: `CLIENT`

Get information about users who have authorized the client, hereafter referred
to as a "user of the client".

> [!NOTE]
>
> The `email` scope does *not* make e-mails visible in the client API. Use the
> OpenID API instead.

`// TODO: Link to OpenID API`

## Table of Contents

1. [Types](#types)
   1. [User](#user) \<<\<<\<<< Updated upstream
   2. [Group](#group)
   3. [Group with Post](#group-with-post)
   4. [Post](#post)
   5. [Super group](#super-group)
2. [Endpoints Reference](#endpoints-reference)
   01. [GET /users](#get-users)
   02. [GET /users/:id](#get-usersid)
   03. [GET /groups](#get-groups)
   04. [GET /groups/for/:id](#get-groupsforid)
   05. [GET /superGroups](#get-supergroups)
   06. [GET /authorities](#get-authorities)
   07. [GET /authorities/for/:id](#get-authoritiesforid) =======
   08. [Group](#group)
   09. [Group with Post](#group-with-post)
   10. [Post](#post)
   11. [Super group](#super-group)
3. [Endpoints Reference](#endpoints-reference)
   1. [GET /users](#get-users)
   2. [GET /users/:id](#get-usersid)
   3. [GET /groups](#get-groups)
   4. [GET /groups/for/:id](#get-groupsforid)
   5. [GET /superGroups](#get-supergroups)
   6. [GET /authorities](#get-authorities)
   7. [GET /authorities/for/:id](#get-authoritiesforid)

> > > > > > > Stashed changes

## Types

### User

Describes a user of the client.

```yaml
{
    cid: string
    nick: string
    firstName: string
    lastName: string
    id: UUID
    acceptanceYear: int
}
```

<details>
<summary>Example</summary>

```json
{
	"cid": "janed",
	"nick": "Dough",
	"firstName": "Jane",
	"lastName": "Doe",
	"id": "2f63a363-af22-480d-be49-531c1831933c",
	"acceptanceYear": 2025
}
```

</details>

### Group

Describes a Gamma group.

```yaml
{
    id: UUID
    name: string
    prettyName: string
    superGroup: SuperGroup
}
```

<details>
<summary>Example</summary>

```json
{
	"id": "7ec28eaa-7203-47fb-9c80-8b1678936be9",
	"name": "prit26",
	"prettyName": "P.R.I.T. 26",
	"superGroup": {
		"id": "32da51ec-2854-4bc2-b19a-30dad5dcc501",
		"name": "prit",
		"prettyName": "P.R.I.T.",
		"type": "committee",
		"svDescription": "PR och rustmästeri",
		"enDescription": "PR and premises maintenance"
	}
}
```

</details>

### Group with Post

```yaml
{
    id: UUID
    name: string
    prettyName: string
    superGroup: SuperGroup
	post: Post
}
```

<details>
<summary>Example</summary>

```json
{
	"id": "3cf94646-2412-4896-bba9-5d2410ac0c62",
	"name": "prit25",
	"prettyName": "P.R.I.T. 25",
	"superGroup": {
		"id": "f06d3eb5-c718-4857-9fac-c457a3ab82a7",
		"name": "sprit",
		"prettyName": "S.P.R.I.T.",
		"type": "alumni",
		"svDescription": "",
		"enDescription": ""
	},
	"post": {
		"id": "0b960919-6dc0-4128-b772-c31840b7b8f7",
		"version": 30,
		"svName": "MaterialChef",
		"enName": "MaterialChef"
	}
}
```

</details>

### Post

```yaml
{
    id: UUID
    version: int
    svName: string
    enName: string
}
```

<details>
<summary>Example</summary>

```json
{
	"id": "2a1a66a2-8e58-461c-96f1-9408a9c543f9",
	"version": 30,
	"svName": "Medlem",
	"enName": "Member"
}
```

</details>

### Super group

Describes a Gamma super group.

```yaml
{
    id: UUID
    name: string
    prettyName: string
    type: "alumni" | "committee" | "functionaries" | "society"
    svDescription: string
    enDescription: string
}
```

<details>
<summary>Example</summary>

```json
{
	"id": "dea3493e-66e4-44b2-a657-cb57a6840dab",
	"name": "digit",
	"prettyName": "digIT",
	"type": "committee",
	"svDescription": "Digitala system",
	"enDescription": "Digital systems"
}
```

</details>

## Endpoints Reference

The client API is currently hosted at <https://auth.chalmers.it/api/client/v1>
and all endpoints in this section are relative to this URL.

### GET /users

Get all users of the client.

**Return type**: [User](#user) list

#### Example

Request: `GET /users`

<details>
<summary>Response</summary>

```json
[
	{
		"cid": "janed",
		"nick": "Dough",
		"firstName": "Jane",
		"lastName": "Doe",
		"id": "2f63a363-af22-480d-be49-531c1831933c",
		"acceptanceYear": 2025
	},
	{
		"cid": "smithj",
		"nick": "Smithed",
		"firstName": "John",
		"lastName": "Smith",
		"id": "9acb43d4-42f3-4f9d-9f37-bc156463e1a5",
		"acceptanceYear": 2026
	}
]
```

</details>

### GET /users/:id

Get a user of the client.

**Return type**: [User](#user)

#### Errors

- If the user has not authorized the client.

#### Example

Request: `GET /users/2f63a363-af22-480d-be49-531c1831933c`

<details>
<summary>Response:</summary>

```json
{
	"cid": "janed",
	"nick": "Dough",
	"firstName": "Jane",
	"lastName": "Doe",
	"id": "2f63a363-af22-480d-be49-531c1831933c",
	"acceptanceYear": 2025
}
```

</details>

### GET /groups

Get all Gamma groups.

**Return type**: [Group](#group) list

#### Example

Request: `GET /groups`

<details>
<summary>Response</summary>

```json
[
	{
        "id": "3cf94646-2412-4896-bba9-5d2410ac0c62",
        "name": "prit25",
        "prettyName": "P.R.I.T. 25",
        "superGroup": {
            "id": "f06d3eb5-c718-4857-9fac-c457a3ab82a7",
            "name": "sprit",
            "prettyName": "S.P.R.I.T.",
            "type": "alumni",
            "svDescription": "",
            "enDescription": ""
        }
    },
	{
        "id": "7ec28eaa-7203-47fb-9c80-8b1678936be9",
        "name": "prit26",
        "prettyName": "P.R.I.T. 26",
        "superGroup": {
            "id": "32da51ec-2854-4bc2-b19a-30dad5dcc501",
            "name": "prit",
            "prettyName": "P.R.I.T.",
            "type": "committee",
            "svDescription": "PR och rustmästeri",
            "enDescription": "PR and premises maintenance"
        }
    },
	{
        "id": "64c623a0-31ce-4519-9fbf-67f207f88286",
        "name": "fikit25",
        "prettyName": "FikIT 25",
        "superGroup": {
            "id": "f5dd9c81-838b-49ec-bab4-a831331c4dc2",
            "name": "fikit",
            "prettyName": "FikIT",
            "type": "society",
            "svDescription": "",
            "enDescription": ""
        }
    },
	{
        "id": "59c01004-a961-499c-96ef-1a3785f9ddd8",
        "name": "samlag25",
        "prettyName": "SAMLAG 25",
        "superGroup": {
            "id": "2d75da98-c4a0-43af-9067-61320c891185",
            "name": "samlag",
            "prettyName": "Skol-Avslutnings-Musik-Ledar-Arbets-Gruppen",
            "type": "functionaries",
            "svDescription": "Skolavlutning",
            "enDescription": "End of year choir"
        }
    }
]
```

</details>

### GET /groups/for/:id

Get all groups which a user of the client is in.

**Return type**: [Group with Post](#group-with-post) list

#### Errors

- If the user has not authorized the client.

#### Example

Request: `GET /groups/for/2f63a363-af22-480d-be49-531c1831933c`

<details>
<summary>Response</summary>

```json
[
    {
        "id": "3cf94646-2412-4896-bba9-5d2410ac0c62",
        "name": "prit25",
        "prettyName": "P.R.I.T. 25",
        "superGroup": {
            "id": "f06d3eb5-c718-4857-9fac-c457a3ab82a7",
            "name": "sprit",
            "prettyName": "S.P.R.I.T.",
            "type": "alumni",
            "svDescription": "",
            "enDescription": ""
        },
        "post": {
            "id": "0b960919-6dc0-4128-b772-c31840b7b8f7",
            "version": 30,
            "svName": "MaterialChef",
            "enName": "MaterialChef"
        }
    },
    {
        "id": "01b42763-eeb5-4989-8c8d-364b472f592c",
        "name": "hookit26",
        "prettyName": "HookIT 26",
        "superGroup": {
            "id": "8f87a4ac-869f-4a6a-a64e-815eb551d1da",
            "name": "hookit",
            "prettyName": "HookIT",
            "type": "society",
            "svDescription": "",
            "enDescription": ""
        },
        "post": {
            "id": "2a1a66a2-8e58-461c-96f1-9408a9c543f9",
            "version": 30,
            "svName": "Medlem",
            "enName": "Member"
        }
    }
]
```

</details>

### GET /superGroups

Get all Gamma super groups.

**Return type**: [Super group](#super-group) list

#### Example

Request: `GET /superGroups`

<details>
<summary>Response</summary>

```json
[
	{
		"id": "f06d3eb5-c718-4857-9fac-c457a3ab82a7",
		"name": "sprit",
		"prettyName": "S.P.R.I.T.",
		"type": "alumni",
		"svDescription": "",
		"enDescription": ""
    },
	{
		"id": "32da51ec-2854-4bc2-b19a-30dad5dcc501",
		"name": "prit",
		"prettyName": "P.R.I.T.",
		"type": "committee",
		"svDescription": "PR och rustmästeri",
		"enDescription": "PR and premises maintenance"
    },
	{
		"id": "f5dd9c81-838b-49ec-bab4-a831331c4dc2",
		"name": "fikit",
		"prettyName": "FikIT",
		"type": "society",
		"svDescription": "",
		"enDescription": ""
    },
	{
		"id": "2d75da98-c4a0-43af-9067-61320c891185",
		"name": "samlag",
		"prettyName": "Skol-Avslutnings-Musik-Ledar-Arbets-Gruppen",
		"type": "functionaries",
		"svDescription": "Skolavlutning",
		"enDescription": "End of year choir"
	}
]
```

</details>

### GET /authorities

Get the names of all [client authorities](<>) on the client.

`// TODO: Create client authorities docs`

**Return type**: String list

#### Example

Request: `GET /authorities`

<details>
<summary>Response</summary>

```json
[
    "clientadmins",
    "specialuser"
]
```

</details>

### GET /authorities/for/:id

Get the names of the [client authorities](<>) which the user belongs to.

`// TODO: Create client authorities docs`

> [!NOTE]
>
> Unlike groups the user does not need to have authorized the client in order
> for the client to check their authorities.

**Return type**: String list

#### Example

Request: `GET /authorities/2f63a363-af22-480d-be49-531c1831933c`

<details>
<summary>Response</summary>

```json
[
    "specialuser"
]
```

</details>
