package org.qbeek;

import org.apache.avro.Schema;
import org.apache.avro.data.Json;
import org.apache.avro.file.DataFileWriter;
import org.apache.avro.generic.GenericData;
import org.apache.avro.generic.GenericRecord;
import org.apache.avro.io.DatumWriter;

import java.io.File;
import java.io.IOException;

public class Example {

    public static void test() {

        System.out.println("Example.test");

        // Json datum writer pour les GenericRecord
        DatumWriter writer = new Json.ObjectWriter();

        // File writer
        File file = new File("users2.avro");
        DataFileWriter<GenericRecord> fileWriter =
                new DataFileWriter<GenericRecord>(writer);

        try {
            // Schema
            ClassLoader classLoader = ClassLoader.getSystemClassLoader();
            File schemaFile = new File(classLoader.getResource("user.avsc").getFile());
            Schema schema = new Schema.Parser().parse(schemaFile);
            System.out.println(schema);

            // Some records
            GenericRecord user1 = new GenericData.Record(schema);
            user1.put("name", "Alyssa");
            user1.put("favorite_number", 256);
            // Leave favorite color null

            GenericRecord user2 = new GenericData.Record(schema);
            user2.put("name", "Ben");
            user2.put("favorite_number", 7);
            user2.put("favorite_color", "red");

            fileWriter.create(schema, file);
            fileWriter.append(user1);
            fileWriter.append(user2);
            fileWriter.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
