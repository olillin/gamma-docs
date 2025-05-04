# Gamma Documentation

## About this Document

This document is is aimed at developers looking to use the Gamma API to
provide their users with the ability to login with Gamma or to fetch data from
the Gamma API in general.

It was written by Cal (Oliver Lindell) to demistify how to use and integrate
with Gamma after painstakingly figuring out how to do so without documentation.

### Contributing

Contributions to this document are welcome and much appreciated. Contact Cal or
digIT to find out how you can help.

### The Future

In the future this document will be hopefully be hosted on some official place
such as the GitHub wiki page for Gamma or on some *chalmers.it* website.

## Introduction

### What is Gamma?

Gamma is the authentication and authorization service developed and used by the
IT student division at Chalmers.

It is hosted at <https://auth.chalmers.it> and the source code can be found on
GitHub [here](https://github.com/cthit/Gamma).

## Getting Started with Gamma Clients

> NOTE TO SELF: This section will be about how to create your first client, what
> a client is and the different ways to authenticate with Gamma.

### What is a Client?

> TODO:

### Creating your first Gamma Client

> [!IMPORTANT]  
> To create a client you must have a Gamma account, you can register yours
> [here](https://auth.chalmers.it/activate-cid). Detailed instructions can be
> found on [wikIT](https://wiki.chalmers.it/Gamma#HowTo:_Skapa_Gamma-konto).

After creating your Gamma account you can follow these steps to create your
first Gamma client:

1. Login to <https://auth.chalmers.it> with your Gamma account and go to the
   "**Your clients**" menu and click "**Create client**". Or go to
   <https://auth.chalmers.it/my-clients/create>.

   ![Navigation steps when creating a new Gamma client](./images/web/gamma-client/creation-navigation.jpg)

2. Fill in your client details, here is an explanation of the different fields:

   | Field               | Description                                                                                                                                                                                                            |
   |---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
   | Pretty name         | The name that is shown to your users when authorizing your client. Look at the [authorization page](#the-authorization-page) for reference.                                                                            |
   | Swedish description | A short description in Swedish explaining what your client is for. Appears on the ["**Your accepted clients**"](https://auth.chalmers.it/me/accepted-clients) page for users with Swedish as their preferred language. |
   | English description | A short description in English explaining what your client is for. Appears on the ["**Your accepted clients**"](https://auth.chalmers.it/me/accepted-clients) page for users with English as their preferred language. |
   | Redirect url        | This is the URL that users will be redirected to after authorizing your client as part of the OAuth flow. You can read more about redirect URLs [here](https://www.oauth.com/oauth2-servers/redirect-uris).            |
   | Generate api key    | Whether or not an API key should be created for this client, this cannot be done after creating your client. To figure out if you need this, read the [API keys](#api-keys) section.                                   |
   | Include email scope | Select this option if you need access to the email adress of your users. Read more in the [scopes](#scopes) section.                                                                                                   |

   ![Creating a new client](./images/web/gamma-client/creation-menu.jpg)

3. You have now created your first Gamma client and should be on the client
   page. Let's go through what

### The Client Page

### Authorizing your Client

> NOTE TO SELF: This section will include how to generate an authorization URL,
> how to use this (simply redirecting users to it) and how to generate a token
> from your code.

#### The Authorization Page

![Screenshot of the authorization page](./images/web/authorize-client.jpg)
