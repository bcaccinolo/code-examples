
## Source : 
https://www.codejava.net/frameworks/hibernate/java-hibernate-jpa-annotations-tutorial-for-beginners

## DB commands
Let's get a db
```
docker pull mysql:8
```

### Let's run the db
```
docker run --rm --name db-test-hibernate -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=usersdb mysql:8
```

### Get ip to connect
```
d inspect db-test-hibernate | a IPAddress
```

172.18.0.3

### Stop the db container
`
d container stop db-test-hibernate
`

### Connect to the db
`
 mycli -u root -p root -h 172.18.0.3 userdb
`

### Fill the db 
`
mycli -u root -p root -h 172.18.0.3 userdb < init.sql
`



