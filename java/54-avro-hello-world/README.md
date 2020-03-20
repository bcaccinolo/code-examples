


## Avro tools 

```shell script
AVRO_TOOLS=/home/benoit/.m2/repository/org/apache/avro/avro-tools/1.9.2/avro-tools-1.9.2.jar
SCHEMA_PATH=src/main/resources/schemas/user.avsc

java -jar $AVRO_TOOLS compile schema $SCHEMA_PATH .
```


java -jar /path/to/avro-tools-1.9.2.jar compile schema user.avsc .

