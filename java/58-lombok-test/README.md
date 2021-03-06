
Simple DB connection for Mysql or H2. 
And test unique constraints.

## Notes

- it works fine in IDE and in console 
`
mvn clean package
java -jar target/HibernateJPABeginner-1.0-SNAPSHOT-jar-with-dependencies.jar
`

## DB commands
Let's get a db
`
docker pull mysql:8
`

### set db settings

`
DB_NAME=usersdb
DB_CONTAINER_NAME=db-test-hibernate
echo $DB_NAME
echo $DB_CONTAINER_NAME
`

### Let's run the db
`
docker run -d --rm --name $DB_CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=$DB_NAME mysql:8
`

### Get ip to connect

<!-- 🐙🐙😂 Update the DATABASE IP 😂 in the persistence.xml -->
<!-- 🐙🐙😂 Update the DATABASE IP 😂 in the persistence.xml -->
<!-- 🐙🐙😂 Update the DATABASE IP 😂 in the persistence.xml -->
`
DB_IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' db-test-hibernate`
echo $DB_IP
`

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



