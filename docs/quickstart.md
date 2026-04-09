# Quickstart Guide

In this guide, we will build a basic website featuring login with Gamma using
OAuth 2.0 and the [OpenID API](api/openid.md), similar to the
[Gamma Demo](https://github.com/olillin/gamma-demo) created by
[Cal](https://github.com/olillin).

If you have not done so already, follow the guide on
[Creating a User Client](website.md#creating-a-user-client).

[TOC]

## The Authorization Code Flow

"Logging in" to a website with Gamma is actually a form of authorization. The is
authorizing your client to get information about them from the Gamma API. This
is done using the OAuth 2.0 Authorization Code Flow, for which we will have to
familiarize ourselves with a few OAuth 2.0 concepts:

`// TODO: Improve descriptions`

| Term               | Explanation                                                                                                                                |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Authorization URL  | URL on Gamma which takes the user to the login screen. Includes the **Client ID**, **Redirect URI** and **Scopes**.                        |
| Client Id          | Public identifier for your client.                                                                                                         |
| Client Secret      | Secret key which your client uses to authenticate itself. **Anyone with this can impersonate your client.**                                |
| Redirect URI       | URI on your server where the user is redirected after approving or denying your client.                                                    |
| Scopes             | What information the client will be able to access about the user. Read more on the [Authorization](api/authorization.md#scopes) page.<br> |
| Authorization Code | Acquired after the user approves the client on the login screen. Is exchanged for an **Access Token** by your client.                      |
| Access Token       | Used to authorize API requests to Gamma.                                                                                                   |

Got all that? Great! The authorization flow we will implement looks like this:

1. User presses the login button on the website. This causes the browser to ask
    your backend client to authorize by redirecting to `/authorize`.
2. Your client tells the browser to redirect to the **Authorization URL**
    containing your client details.
3. The user is now presented with the Gamma login and consent screens where the
    user can see what information your client will be able to access and may
    approve or deny it.
4. After approving or denying your client Gamma will redirect the browser to
    your **Redirect URI**. Assuming the client is approved an **Authorization
    Code** will be included in the `code` query parameter. Your client then
    sends the code to the Gamma API together with the client credentials.
5. Gamma responds with an **Access Token**, hooray!

![Authorization code flow diagram](images/authorization-code-flow-dark.png#only-dark)
![Authorization code flow diagram](images/authorization-code-flow-light.png#only-light)

/// caption
Diagram of the Authorization Code Flow in Gamma.
///

Read more about authorizing with the Gamma API on the dedicated
[Authorization](api/authorization) page.

## Getting Started

If you want to follow along you can clone the Git repository at: `// TODO`

You will need to install Node.js® from the
[official downloads page](https://nodejs.org/en/download). If you are using
[Nix](https://nixos.org), just run `nix develop` to use the development shell
provided by the flake.

Then run this command in your terminal to install all dependencies:

```console
npm install -D
```

This will (among others) install [gammait](https://npmx.dev/gammait), a Gamma
API Client for Node.js® which we will use for this guide.

To start a development server run this command in your terminal:

```console
npm run dev
```

Wait a bit and then click the printed URL. You should see a mostly empty page
with a "Hello Gamma Login!". Let's implement login!

!!! tip

    **Keep the terminal open** and the website will reload automatically when you
    update the source code.

`// TODO: Explain/mention backend endpoints`

## Adding Login

## Handling Failed Login

It is important to consider what will happen if the user does not approve your
client when logging in. In this case the user will still be redirected to the
**Redirect URI** but instead of `code` the URL will have these parameters:

| Name              | Value                                                           |
| ----------------- | --------------------------------------------------------------- |
| error             | access_denied                                                   |
| error_description | OAuth2.0 Parameter: client_id                                   |
| error_uri         | <https://datatracker.ietf.org/doc/html/rfc6749#section-4.1.2.1> |

We can check for `error=access_denied` to detect when a user denied logging in.
Alternatively, we can check for the absence of the `code` parameter.

`// TODO Implementation`

## Using other APIs

Now that the user has logged in to the client we can use their id in requests to
other Gamma APIs. Let's get the groups the user is part of using the
[Client API](api/client-api.md):

```typescript
// ...

import { ClientApi } from 'gammait'

const apiKeyId = process.env.API_KEY_ID
const apiKey = process.env.API_KEY
// TODO: Remove?
const authorization = `pre-shared ${apiKeyId}:${apiKey}`

const clientApi = new ClientApi({
	// TODO: Use real syntax or update gammait
	apiKeyId: apiKeyId,
	apiKey: apiKey
})

app.get('/profile', async (req, res) => {
    // ...
	const profile: UserInfo = await authorizedClient.userInfo()
	
	// Get the user's groups
	const userId: string = profile.sub
	const groups: GroupWithPost[] = await clientApi.getGroupsFor(userId)
	
	// Show the group names and post
	const prettyGroups: string[] = groups.map(group =>
		`${group.prettyName} - ${group.post.enName}`
	)

    // ...
})
```

`// TODO`
