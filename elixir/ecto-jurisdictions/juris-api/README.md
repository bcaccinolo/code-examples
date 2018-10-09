# Juris

## Launch the server
```
iex -S mix
```

http://localhost:3100/fuzzy/bul

## Changelog
Everything is in Trello:
https://trello.com/b/eZ9EzyaA/juridictions-api

# Specifications
https://docs.google.com/document/d/1tC5tqynh8lV8jj7-kF31ZzRYHwd0van_3cKdnuTGlfw/edit#

## Todo / Tasks
Everything is in Trello:
https://trello.com/b/eZ9EzyaA/juridictions-api

## Setup

### Setup the database
The project uses Postgres, we uses a Docker image.
```
cd ops/
docker-compose up
```

### Migrations
```mix ecto.migrate```

### Loads Seeds
```mix seeds.load```

### Activate fuzzy search
```mix db.set_extension```

## Query Jurisdictions
Ecto make it simple and straightforward https://hexdocs.pm/ecto/Ecto.Query.html#from/2

## Testing

### DB setup for testing
```
 MIX_ENV=test mix ecto.drop
 MIX_ENV=test mix ecto.create
 MIX_ENV=test mix ecto.migrate
 MIX_ENV=test mix seeds.load
 MIX_ENV=test mix db.set_extension
```

## Possible setup problem

Running iex, there was this kind if problem:
```
iex -S mix

== Compilation error in file lib/repo.ex ==
** (CompileError) lib/repo.ex:2: module Ecto.Repo is not loaded and could not be found
    (elixir) expanding macro: Kernel.use/2
    lib/repo.ex:2: Repo (module)
```
To solve this:
```
mix deps.clean --all
mix deps.get
iex -S mix
```
