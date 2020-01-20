

# Source
https://www.baeldung.com/database-migrations-with-flyway

# Test flyway migration 
I use the flyway client and not the maven plugin

```
brew install flyway
```

```
flyway -configFiles=src/main/resources/flyway.properties migrate
```

