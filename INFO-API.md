# Info API Reference

**API Key Type**: `INFO`  

Get detailed information about users. Used by for instance
[chalmers.it](https://chalmers.it) to get user and group information to display
on corresponding pages.

## Get user details

`GET` `/users/{id}`

### Parameters

> | Name | Type     | Data Type | Description   |
> |------|----------|-----------|---------------|
> | id   | required | UUID      | The user UUID |

### Responses

> | Status Code   | Content-Type       | Response                         |
> |---------------|--------------------|----------------------------------|
> | `200`         | `application/json` | [User Type 1](./README.md#user-type-1-info-api) |
> | `302`         | N/A                | N/A                              |

</details>

</details>
