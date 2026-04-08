# Gamma Documentation

## About this Document

This document is is aimed at developers looking to use the Gamma API to provide
their users with the ability to login with Gamma and/or to fetch data from the
Gamma API.

It was written by Cal to demistify how to use and integrate with Gamma after
painstakingly figuring out how to do so without proper documentation.

/// warning | This documentation may be inaccurate

As I (Cal) am not a Gamma administrator I have limited ability to test and
document the features of Gamma. Parts of the documentation may therefore be
limited or inaccurate. ///

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

To access Gamma's APIs a client is required to identify your application. The
client is how your service is represented in Gamma and is what is displayed to
users when authorizing ("logging in") to your service.

### Types of clients

Gamma has two types of clients, *User clients* and *Official clients*.

#### User Clients

A *user client* can be created by anyone with a Gamma account but is limited
compared to an official client. User clients can only access parts of the \[Info
API\] and can only fetch data from users who have authorized the client. A
warning is also shown to users when authorizing a user client with information
about who the client belongs to.

#### Official Clients

To do more you must be a Gamma administrator and create an *official client*.
These clients have unrestricted access to the Gamma API and can fetch data from
all users.

### The Client Page

### Authorizing your Client

> NOTE TO SELF: This section will include how to generate an authorization URL,
> how to use this (simply redirecting users to it) and how to generate a token
> from your code.

## Further Reading

- [API Reference](api/index.md)
- [History of Gamma](history.md)
