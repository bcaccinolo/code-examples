## source 
https://www.baeldung.com/spring-security-jdbc-authentication

## Retour
Authentification with mysql
 
It's fixed now. 

## Database

Env var are in `.env`

```shell script
docker run -p 3306:3306 -d --rm --name $MYSQL_CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_DATABASE=$MYSQL_DATABASE mysql:8
```

Stop container
```shell script
docker container stop $MYSQL_CONTAINER_NAME
```

SQL client
```shell script
mycli -h $MYSQL_ADDRESS -u root -p pass  $MYSQL_DATABASE
```
