# Info API Reference

Get detailed information about users. Used by for instance
[chalmers.it](https://chalmers.it) to get user and group information to display
on corresponding pages.

| Name           | Value                                                                                                                                                 |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| API Key Type   | `INFO`                                                                                                                                                |
| API Controller | [InfoV1ApiController](https://github.com/cthit/Gamma/blob/main/app/src/main/java/it/chalmers/gamma/adapter/primary/api/info/InfoV1ApiController.java) |

## Types Reference

These are the types used by the Info API.

### User

## Endpoints Reference

### Get user details

`GET` `/users/{id}`

#### Parameters

| Name | Type     | Data Type | Description   |
| ---- | -------- | --------- | ------------- |
| id   | required | UUID      | The user UUID |

#### Responses

| Status Code | Content-Type       | Response                                        |
| ----------- | ------------------ | ----------------------------------------------- |
| `200`       | `application/json` | [User Type 1](./README.md#user-type-1-info-api) |
| `302`       | N/A                | N/A                                             |

`// TODO More endpoints`
