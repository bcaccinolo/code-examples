
## Note
authentification a partir des users dans la base de données

## Todo 

- ok install flyway
- >> install 1er migration users ...
- install des datas

## Run from command line 

`
./mvnw spring-boot:run
`

## DB configuration

Let's get a db
`
docker pull mysql:8
`

### set db settings

All the db env variables are stored in a `.env` file.

### Let's run the db
`
docker run -d --rm --name $DB_CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=$DB_NAME mysql:8
`

### Get ip to connect

Once the container is started, the `.env` file exports the IP of the container in `DB_IP`

Validate 
`
env | sort | ack DB_
`

You should have something like this 
`
DB_CONTAINER_NAME=db-test-java
DB_IP=172.18.0.3
DB_NAME=db_example
`

### Stop the db container
`
docker container stop $DB_CONTAINER_NAME
`

### Connect to the db
`
 mycli -u root -p root -h $DB_IP $DB_NAME
`

### Flyway : Fill the db 
`
flyway -configFiles=src/main/resources/application.properties migrate
`



