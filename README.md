# phx-jokes-api

An example [Phoenix](https://www.phoenixframework.org/) project that provides an unified API to call different humorous APIs.

The humorous APIs are:

* https://api.chucknorris.io
* https://baconipsum.com/json-api/
* https://thesimpsonsquoteapi.glitch.me

## Prerequirements

See also Phoenix [installation](https://hexdocs.pm/phoenix/installation.html).

Install [Hex](https://hex.pm/) package manager:
```bash
$ mix local.hex
```

Install Phoenix application generator:
```bash
$ mix archive.install hex phx_new
```

## Bootstrap the API-only Phoenix Application

Generator help:
```bash
$ mix help phx.new
```

Generate the application:
```bash
$ mix phx.new jokes --install --no-assets --no-ecto --no-gettext --no-html --no-mailer
```

Start the application:
```bash
$ cd jokes
$ mix phx.server
```

At this point there is nothing but the Phoenix dashboard: http://localhost:4000/dev/dashboard/

## Running Tests

```bash
$ mix test
```

## How to Call the API

Supported query parameters:
* Mandatory: `family` - valid values: `chucknorris`, `ipsum`, `simpsons`
* Optional: `amount` - integer greater than zero, defaults to 1.

Examples:
```bash
$ curl --verbose 'http://localhost:4000/api/jokes/v1?family=simpsons&amount=2'
```

Note the version in the path, i.e. `jokes/v1` or `jokes/v2`.

### Error Responses

HTTP status code 400 Bad Request with error details in payload:
```json
{"message":"error details"}
```

## Version 1

The basic Phoenix skeleton where:
* the query parameters are validated
* the query is routed to the correct handler
* returns hard-coded response, no actual api calls yet
* all code in the controller

So no jokes returned yet!

## Version 2

Install additional dependencies:
```bash
$ mix deps.get
```

Compared to v1:
* Application code has been separated from the Phoenix code.


## TODO

* Call the actual APIs.
* Customised responses for 404 and 500.
* `amount` can also be Roman numeral.
