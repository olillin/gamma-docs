# OpenID API

[TOC]

## Types

See also the
[OpenID specification](https://openid.net/specs/openid-connect-core-1_0.html)
for more information about these types.

### User Info

```yaml
# Required 'openid' scope
sub: UserId # Gamma user ID
iss: "https://auth.chalmers.it" # Token issuer identifier (Gamma URL)
aud: string[] # Audience the token is intended for (your client ID)
scope: ("openid" | "profile" | "email")[] # Token scopes
jti: UUID # JWT ID
iat: Timestamp # Time at which the JWT was issued
exp: Timestamp # Expiration time for the JWT
nbf: Timestamp # JWT cannot be used before this time

# If 'profile' scope
cid: string # Chalmers ID
nickname: string
family_name: string
given_name: string
name: string # Full name as "given_name 'nickname' family_name"
locale: "sv" | "en" # Preferred language selected in Gamma
picture: string # Gamma profile picture URL

# If 'email' scope
email: string
```

??? example

    ```json
    {
      "sub": "2f63a363-af22-480d-be49-531c1831933c",
      "iss": "https://auth.chalmers.it",
      "aud": [
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234"
      ],
      "scope": [
        "openid",
        "profile",
        "email"
      ],
      "jti": "06002dfd-95b3-492a-8bd9-99aa569dabce",
      "iat": 1775571939,
      "exp": 1775572239,
      "nbf": 1775571939,
      "cid": "janed",
      "nickname": "Dough",
      "family_name": "Doe",
      "given_name": "Jane",
      "name": "Jane 'Dough' Doe",
      "locale": "sv",
      "picture": "https://auth.chalmers.it/images/user/avatar/2f63a363-af22-480d-be49-531c1831933c",
      "email": "janed@chalmers.se"
    }
    ```

## Endpoints Reference

The OpenID API is special as it uses standardized routes rather than a custom
controller. All endpoints in this section are therefore relative to
<https://auth.chalmers.it>.

### GET /oauth2/userinfo

Get the UserInfo of of the client. See also
[5.3. UserInfo Endpoint](https://openid.net/specs/openid-connect-core-1_0.html#UserInfo)
in the OpenID specification:

> The UserInfo Endpoint is an OAuth 2.0 Protected Resource that returns Claims
> about the authenticated End-User. To obtain the requested Claims about the
> End-User, the Client makes a request to the UserInfo Endpoint using an Access
> Token obtained through OpenID Connect Authentication. These Claims are
> normally represented by a JSON object that contains a collection of name and
> value pairs for the Claims.

**Return type**: [User Info](#user-info)

#### Example

??? example "Click to show example request and response"

    #### Request

    `GET /oauth2/userinfo`

    #### Response

    ```json
    {
      "sub": "2f63a363-af22-480d-be49-531c1831933c",
      "iss": "https://auth.chalmers.it",
      "aud": [
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234"
      ],
      "scope": [
        "openid",
        "profile",
        "email"
      ],
      "jti": "06002dfd-95b3-492a-8bd9-99aa569dabce",
      "iat": 1775571939,
      "exp": 1775572239,
      "nbf": 1775571939,
      "cid": "janed",
      "nickname": "Dough",
      "family_name": "Doe",
      "given_name": "Jane",
      "name": "Jane 'Dough' Doe",
      "locale": "sv",
      "picture": "https://auth.chalmers.it/images/user/avatar/2f63a363-af22-480d-be49-531c1831933c"
    }
    ```
