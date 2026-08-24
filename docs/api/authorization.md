# Authorization

The Gamma API uses a mix of
[OAuth 2.0](https://auth0.com/intro-to-iam/what-is-oauth-2) and
[Pre-shared keys](https://en.wikipedia.org/wiki/Pre-shared_key) (PSK) for
authorization.

## Authorization Flows

Gamma currently supports the [Authorization Code Flow](#authorization-code-flow)
and [Client authorization using API keys](#client-authorization-using-api-keys).

### Authorization Code Flow

The OAuth 2.0 Authorization Code flow is used when accessing protected resources
belonging to the user, such as when
[authenticating](https://auth0.com/docs/get-started/identity-fundamentals/authentication-and-authorization)
a user (verifying who they are) by fetching their
[user info](./openid.md#get-oauth2userinfo).

This section describes the specifics of using the authorization code flow with
Gamma. For more details about the flow itself, see
[this article about the Authorization Code flow by Auth0](https://auth0.com/docs/get-started/authentication-and-authorization-flow/authorization-code-flow).

For an example of how to use the flow, see the
[Quickstart Guide](../quickstart.md).

`// TODO: Actually document how the flow works`

#### Getting an access token

These are the paths for the OAuth 2.0 endpoints. They are relative to
<https://auth.chalmers.it>.

| HTTP Method | Path                | Name          | Description                                              |
| ----------- | ------------------- | ------------- | -------------------------------------------------------- |
| `GET`       | `/oauth2/authorize` | Authorization | User is sent here when authorizing the client            |
| `POST`      | `/oauth2/token`     | Token         | Authorization code is posted here to get an access token |

After getting an access token it is provided in requests as part of the
`Authorization` header:

```console
Authorization: Bearer <ACCESS TOKEN>
```

#### Scopes

Scopes specify which information a client is allowed to access.

Scopes are sent to Gamma in the authorization URL as the `scope` query
parameter. Clients must request all scopes they are approved for when
authorizing, or else a [mismatched scopes](../website.md#mismatched-scopes)
error will be presented to the user. All clients have the `openid` and `profile`
scopes by default, the `email` scope is available if the client was created with
the [Include email scope](../website.md#creating-a-user-client) option.

| Scope     | Gives access to                                     |
| --------- | --------------------------------------------------- |
| `openid`  | OpenID information like user ID and JWT properties. |
| `profile` | Profile information like CID and names.             |
| `email`   | The user's email.                                   |

#### Super Group Restrictions

Official Gamma clients are able to restrict access to specified super groups.
Users not in these super groups will see
[an error screen](../website.md#missing-access) when trying to authorize. See
[Official Clients](../website.md#official-clients) in the website reference for
how to manage restrictions.

### API Keys

!!! info

    API keys are planned to be replaced by the
    [Client Credentials flow](https://auth0.com/docs/get-started/authentication-and-authorization-flow/client-credentials-flow)
    in Gamma v3[^1].

API keys are used in machine-to-machine authentication when accessing protected
resources from the Gamma APIs. Using API keys is not a real authorization flow,
it is just a shared secret which Gamma accepts.

Gamma has four types of API keys, corresponding to each API:

- `CLIENT`
- `INFO`
- `ALLOW_LIST`
- `ACCOUNT_SCAFFOLD`

Each type of API key can only access the API which matches its own type. These
are also included in the table at the top of each API reference page. `CLIENT`
API keys can be created by any Gamma user when
[creating a client](../website.md#creating-a-user-client) and are linked to that
client. Other types of API keys are standalone and can only be created by Gamma
administrators.

All API keys have an ID and a token which are sent together in the
`Authorization` header on each request to the Gamma API. The API key is sent in
the following format:

```yaml
Authorization: pre-shared <KEY ID>:<API TOKEN>
```

[^1]: cthit/Gamma issue #954 on GitHub, *Support client credentials grant for api
    authentication* — <https://github.com/cthit/Gamma/issues/954>
