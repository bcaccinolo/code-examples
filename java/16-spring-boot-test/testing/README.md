
## Source : 
https://spring.io/guides/gs/testing-web/#_what_youll_need

## Run tess

`
mvn surefire:test
`

## Notes

## DB commands
Let's get a db
`
docker pull mysql:8
`

### set db settings

All the db env variables are stored in a `.env` file.

### Let's run the db
`
docker run --rm --name $DB_CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=$DB_NAME mysql:8
`

### Get ip to connect

Once the container is started, the `.env` file exports the IP of the container in `DB_IP`

### Stop the db container
`
d container stop $DB_CONTAINER_NAME
`

### Connect to the db
`
 mycli -u root -p root -h $DB_IP $DB_NAME
`

### Fill the db 
`
mycli -u root -p root -h $DB_IP $DB_NAME < init.sql
`



