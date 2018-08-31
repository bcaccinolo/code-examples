# test dnsdock

## From the command line

I can set an alias from the command line : `docker run --rm -e DNSDOCK_ALIAS=www.synbioz.test nginx`

## From a Dockerfile

With :
`ENV DNSDOCK_ALIAS=www.synbioz.test`

docker build .

docker run IMAGE

## From a docker-compose.yml

By setting DNSDOCK_ALIAS in the `environment` section of the `web` service.

