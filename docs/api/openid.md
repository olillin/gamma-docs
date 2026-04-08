# OpenID API

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

<details>
<summary>Example</summary>

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

</details>
