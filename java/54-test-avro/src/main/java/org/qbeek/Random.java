package org.qbeek;

import org.apache.avro.Schema;
import org.apache.avro.generic.GenericData;
import org.apache.avro.generic.GenericDatumWriter;
import org.apache.avro.generic.GenericRecord;
import org.apache.avro.io.EncoderFactory;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

public class Random {

    public static void test() {

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
//            File file = new File("users.avro");
//            DatumWriter writer = new Json.ObjectWriter();
//            writer.setSchema(schema);
//
//            DatumWriter<GenericRecord> datumWriter = new GenericDatumWriter<GenericRecord>(schema);
//            DataFileWriter<GenericRecord> dataFileWriter = new DataFileWriter<GenericRecord>(writer);
//            dataFileWriter.create(schema, file);
//            dataFileWriter.append(user1);
//            dataFileWriter.append(user2);
//            dataFileWriter.close();

//            DatumWriter<GenericRecord> writer1 = new GenericDatumWriter<GenericRecord>(schema);
//            byte[] data = new byte[0];
//            ByteArrayOutputStream stream = new ByteArrayOutputStream();
//            Encoder jsonEncoder = null;
//            try {
//                jsonEncoder = EncoderFactory.get().jsonEncoder(
//                        AvroHttpRequest.getClassSchema(), stream);
//                writer1.write(request, jsonEncoder);
//                jsonEncoder.flush();
//                data = stream.toByteArray();
//
//            } catch (IOException e) {
//                e.printStackTrace();
//            }

            // Output to stream
            var writer2 = new GenericDatumWriter<>(schema);
            var outputStream = new ByteArrayOutputStream();
            var encoder = EncoderFactory.get().directBinaryEncoder(outputStream, null);
//            var encoder = EncoderFactory.get().jsonEncoder(schema, outputStream,true);
            writer2.write(user1, encoder);
            writer2.write(user2, encoder);
            encoder.flush();

            System.out.printf("ici");
            System.out.println(outputStream);

            System.out.println(outputStream.toByteArray());




        } catch (IOException e) {
            e.printStackTrace();
        }


    }

}
