# Juris

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

