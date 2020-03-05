
# Todo

- ✅endpoints with tests

    - list [league, season] with results
    GET /lists

    - fetch results for [league, season]
    GET /league/:league/season/:season

- be careful about the architecture to allow an easy switch between protobuf or JSon with the same OpenApi file
  - how do you return protobuf.

  content-type: application/protobuf
  or
  content-type: application/json

- 🔥OpenApi file

- validation open-api can be used with

  - https://github.com/open-api-spex/open_api_spex


- creation of the api file
- which kind of request do we need to do on the data?
- how to store data? Mnesia ? PG ?

## and More ?

- authentication Api key

## Vocabulary

FTHG and HG = Full Time Home Team Goals
FTAG and AG = Full Time Away Team Goals
FTR and Res = Full Time Result (H=Home Win, D=Draw, A=Away Win)

HTHG = Half Time Home Team Goals
HTAG = Half Time Away Team Goals
HTR = Half Time Result (H=Home Win, D=Draw, A=Away Win)

SP1 : la liga
sp2 : segunda division
