# Authorization

The Gamma API uses [OAuth 2.0](https://auth0.com/intro-to-iam/what-is-oauth-2)
for authorization. It supports two OAuth 2.0 authorization flows:

- [Authorization Code Flow](#authorization-code-flow)
- [Client Credentials Flow](#client-credentials-flow)

## Authorization Flows

### Authorization Code Flow

This flow is used when consent from the user is required, such as when
[authenticating](https://auth0.com/docs/get-started/identity-fundamentals/authentication-and-authorization)
a user. This section describes how to use the authorization code flow with
Gamma. For more details about the flow itself, see
[this article by Auth0](https://auth0.com/docs/get-started/authentication-and-authorization-flow/authorization-code-flow).

#### Scopes

Client scopes are sent to Gamma in the authorization URL as the `scope` query
parameter. Scopes allow a client to access personal information of users.
Clients must use all scopes which they have, or else a
[mismatched scopes](../website.md#mismatched-scopes) error will be presented to
the user. All clients have the `openid` and `profile` scopes by default and the
`email` scope if the client was created with the
[Include email scope](../website.md#creating-a-user-client) option.

| Scope     | Gives access to                                     |
| --------- | --------------------------------------------------- |
| `openid`  | OpenID information like user ID and JWT properties. |
| `profile` | Profile information like CID and names.             |
| `email`   | The user's email.                                   |

### Client Credentials Flow

This section describes how to use the client credentials flow with Gamma. For
more details about the flow itself, see
[this article by Auth0](https://auth0.com/docs/get-started/authentication-and-authorization-flow/client-credentials-flow)

The Client Credentials Flow uses an API key to authorize requests to Gamma
without a user having to log in. When a client is created with the
[Generate api key](../website.md#creating-a-user-client) option an API key is
generated. All API keys have an ID and a key which together are sent in the
`Authorization` header to authenticate the client. The API key is sent in the
following format:

```yaml
Authorization: pre-shared <KEY ID>:<API KEY>
```
