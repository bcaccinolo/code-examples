

## Source : 
http://www.javawebtutor.com/articles/jpa/jpa-example-using-maven.php

## DB commands
Let's get a db
```
docker pull mysql:8
```

Let's run the db
```
docker run --rm --name db-test-hibernate -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=hibernate mysql:8
```

Get ip to connect
```
d inspect db-test-hibernate | a IPAddress
```

Stop the db container
```
d container stop db-test-hibernate
```

Connect to the db
```
 mycli -u root -p root -h 172.18.0.3 hibernate
```











