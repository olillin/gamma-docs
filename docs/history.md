# History of Gamma

!!! warning | Incomplete page

This page is still incomplete and many details are missing. Contributions are
much appreciated!

The current account system, Gamma v2, is the fourth iteration of an account
system for the Software Engineering Student Division (IT) at Chalmers. It was
developed by [Portals](https://github.com/Portals) and is still maintained by
him[^1].

## LDAP

The student division had an
[LDAP](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol)
directory. [digIT'13](https://digit.chalmers.it/members/2013) developed a bridge
to the Chalmers LDAP[^2] and an SSO service was developed by
[digIT'14](https://digit.chalmers.it/members/2014) which used the directory as a
foundation[^3].

LDAP authentication was later replaced with Gamma v1 and was officially
deprecated in June 2020[^4].

## Alfa — ???-???

Named after the first letter of the Greek alphabet, Alfa was the first account
system for the student division.

## Beta — ???-2020

Alfa was later replaced with a second system. Fittingly named Beta. It was
hosted at <https://beta-account.chalmers.it>[^5].

The last services were finally migrated from LDAP on May 21st 2020[^4][^6] and
Beta was deprecated.

## Gamma

### Gamma v1 — 2018-2026

During [digIT'18](https://digit.chalmers.it/members/2018) a new account system
was developed. This followed the trend and subsequently named Gamma.

The last services were migrated and Gamma v1 was shut down in March 2026.

### Gamma v2 — 2024–Today

Gamma was rewritten and v2 was released in 2024[^7].

### Gamma v3

Planning of Gamma v3 started in February 2024 as the
[v3 milestone](https://github.com/cthit/Gamma/milestone/19) on the Gamma GitHub
repository.

### Gamma v4

Planning of Gamma v4 started in February 2026 as the
[v4 milestone](https://github.com/cthit/Gamma/milestone/20) on the Gamma GitHub
repository. It is planned to be released a year after Gamma v3.

[^1]: Theo is still developing Gamma — https://github.com/cthit/Gamma/issues/941

[^2]: <https://github.com/cthit/auth>

[^3]: <https://github.com/cthit/chalmersit-account-rails>

[^4]: Deprecating ldap-auth — <https://github.com/cthit/ldap-auth/pull/3>

[^5]: <https://github.com/cthit/KeepIT/blame/3522439de0c52d1e691afdca0e96432da89e1f58/backend/src/github.com/cthit/KeepIT/web/beta_auth.go#L36>

[^6]: Using RDC v1.0, using proxy during development, added max-length to user
    inputs, authenticating users with Gamma and saves access token in cookie —
    <https://github.com/cthit/SuggestIT/pull/43>

[^7]: Gamma v2.0 — <https://github.com/cthit/Gamma/pull/853>
