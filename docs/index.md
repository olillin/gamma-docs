# Gamma Documentation

## About this Document

This document is is aimed at developers looking to use the Gamma API to provide
their users with the ability to login with Gamma and/or to fetch data from the
Gamma API.

It was written by [Cal](https://github.com/olillin) to demistify how to use and
integrate with Gamma after painstakingly figuring out how to do so without
proper documentation.

### Contributing

Contributions to this document are welcome and much appreciated. Contact Cal or
digIT to find out how you can help.

### The Future

In the future this document will be hopefully be hosted on some official place
such as the [GitHub wiki page for Gamma](https://github.com/cthit/Gamma/wiki) or
on some *chalmers.it* website.

## Introduction

### What is Gamma?

Gamma is the authentication and authorization service developed and used by the
IT student division at Chalmers, with the long-term goal of also being adopted
by other student divisions at Chalmers.

It is hosted at <https://auth.chalmers.it> and the source code can be found at
[cthit/Gamma](https://github.com/cthit/Gamma) on GitHub.

## Getting Started with Gamma Clients

### What is a Client?

Gamma is built on top of the OAuth 2.0 protocol. A basic understanding of the
protocol is recommended but not strictly required to understand this
documentation. If you are unfamiliar with it,
[this article](https://auth0.com/intro-to-iam/what-is-oauth-2) by Auth0 serves
as a good starting point.

A client allows access to Gamma through the [Client API](./api/client-api.md)
and [Authorization Code flow](./api/authorization.md#authorization-code-flow).
It identifies your application in Gamma and is shown to users when authorizing
("logging in to") your service.

### Types of clients

Gamma has two types of clients, *User clients* and *Official clients*.

#### User Clients

A *user client* can be created by anyone with a Gamma account but is limited
compared to an official client. User clients can only access parts of the
[Info API](./api/info-api.md) and can only fetch data from users who have
authorized the client.

`// TODO: Update what they can access. Can they really access the info API?`

As any Gamma user can create a user client caution should be given when
authorizing them. That is why [a warning](./website.md#the-authorization-page)
is shown to users when authorizing a user client saying who the client belongs
to.

#### Official Clients

To do more you must be a Gamma administrator and create an *official client*.
These clients have unrestricted access to the Gamma API and can fetch data from
all users.

`// TODO: Update access`

##### Super Group Restrictions

Official clients can also add **Restrictions** on which super groups are allowed
to authorize the client. Users that are not in any of these groups will see
[an error screen](./website.md#missing-access).

## Further Reading

- [Quickstart Guide](quickstart.md)
- [API Reference](api/index.md)
- [History of Gamma](history.md)
