package org.qbeek;

import org.apache.avro.Schema;
import org.apache.avro.file.DataFileWriter;
import org.apache.avro.generic.GenericData;
import org.apache.avro.generic.GenericDatumWriter;
import org.apache.avro.generic.GenericRecord;
import org.apache.avro.io.DatumWriter;

import java.io.File;
import java.io.IOException;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        System.out.println("Hello World!");

        ClassLoader classLoader = ClassLoader.getSystemClassLoader();
        File schemaFile = new File(classLoader.getResource("user.avsc").getFile());
        System.out.println(String.format("The schemaFile path %s", schemaFile));

        try {
            Schema schema = new Schema.Parser().parse(schemaFile);
            System.out.println(schema);

            GenericRecord user1 = new GenericData.Record(schema);
            user1.put("name", "Alyssa");
            user1.put("favorite_number", 256);
            // Leave favorite color null

            GenericRecord user2 = new GenericData.Record(schema);
            user2.put("name", "Ben");
            user2.put("favorite_number", 7);
            user2.put("favorite_color", "red");

            System.out.println(user1);

            // Serialize user1 and user2 to disk
            File file = new File("users.avro");
            DatumWriter<GenericRecord> datumWriter = new GenericDatumWriter<GenericRecord>(schema);
            DataFileWriter<GenericRecord> dataFileWriter = new DataFileWriter<GenericRecord>(datumWriter);
            dataFileWriter.create(schema, file);
            dataFileWriter.append(user1);
            dataFileWriter.append(user2);
            dataFileWriter.close();


        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
