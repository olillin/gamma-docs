# Types

Types in this document are written as [TypeScript](https://www.typescriptlang.org/)
types/interfaces as used in [GammaIT](https://www.npmjs.com/package/gammait).

## Types Reference

### IDs

All* IDs used in requests to and responses from the Gamma API are version 4
UUIDs. However, multiple alias types are used to provide type information about
what the ID is for. For example the Client API `/users/{id}` expects a UUID
that identifies a user, so the type `UserId` is used.

```typescript
import { UUID } from 'crypto'

type UserId = UUID
type GroupId = UUID
type SuperGroupId = UUID
type PostId = UUID
```

### Users

Different formats:

#### User Type 1 (Info API)

```json
{
    "user": {
        "cid": "lindello",
        "nick": "Cal",
        "firstName": "Oliver",
        "lastName": "Lindell",
        "id": "7ba99a26-9ad3-4ad8-ab7f-5891c2d82a4b",
        "acceptanceYear": 2024
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
                    "svDescription": "",
                    "enDescription": ""
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

#### User Type 2 (Clients API)

```json
{
    "cid": "lindello",
    "nick": "Cal",
    "firstName": "Oliver",
    "lastName": "Lindell",
    "id": "7ba99a26-9ad3-4ad8-ab7f-5891c2d82a4b",
    "acceptanceYear": 2024
}
```

#### User Type 3 (Userinfo)

```json
{
    // 'openid' scope (required)
    "sub": "7ba99a26-9ad3-4ad8-ab7f-5891c2d82a4b",
    "iss": "https://auth.chalmers.it",
    "aud": [
        "L6W8ZNOY1H8HVQQLE7S8X6CVY4SWOT"
    ],
    "scope": [
      "openid",
      "profile",
      "email"
    ],
    "jti": "a91135fa-7873-4ea7-a45f-06449d7514df",
    "iat": 1746486325.000000000,
    "exp": 1746486625.000000000,
    "nbf": 1746486325.000000000,

    // 'profile' scope
    "cid": "lindello",
    "nickname": "Cal",
    "family_name": "Lindell",
    "given_name": "Oliver",
    "name": "Oliver 'Cal' Lindell",
    "locale": "sv" | "en",
    "picture": "https://auth.chalmers.it/images/user/avatar/7ba99a26-9ad3-4ad8-ab7f-5891c2d82a4b",

    // 'email' scope
    "email": "oliver.lindell@olillin.com"
}
```
