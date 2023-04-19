# phx-jokes-api
An example [Phoenix](https://www.phoenixframework.org/) project that provides an unified API to call different humorous APIs.

The humorous APIs are:

* https://api.chucknorris.io
* https://baconipsum.com/json-api/
* https://thesimpsonsquoteapi.glitch.me

## Prerequirements

See also Phoenix [Installation](https://hexdocs.pm/phoenix/installation.html).

[Hex](https://hex.pm/) package manager:
```bash
$ mix local.hex
```

Phoenix application generator:
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
