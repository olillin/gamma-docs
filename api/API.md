## The Gamma API

"The Gamma API" actually consists of 4 APIs with different purposes:

- [Client API](./CLIENT-API.md) for users logged in to a client.
- [Info API](./INFO-API.md) to get data as a client without a user.
- [Allow List API](./ALLOW-LIST-API.md) for managing the allow list.
- [Account Scaffold API](./ACCOUNT-SCAFFOLD-API.md)

See the more details about the different APIs in their respective documents.

### API Responses

Successful responses from the Gamma API are returned in
[JSON](https://www.w3schools.com/whatis/whatis_json.asp) format.

Most unsuccessful responses (like authorization errors or requesting resources
that don't exist) will redirect you to the Gamma login page at
<https://auth.chalmers.it/login>. To catch this you can check if the response
header `Content-Type` includes `text/html`, since the returned page is not JSON.
