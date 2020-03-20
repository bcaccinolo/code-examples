package org.qbeek;

import org.apache.avro.Schema;
import org.apache.avro.data.Json;
import org.apache.avro.file.DataFileWriter;
import org.apache.avro.generic.GenericData;
import org.apache.avro.generic.GenericDatumWriter;
import org.apache.avro.generic.GenericRecord;
import org.apache.avro.io.DatumWriter;
import org.apache.avro.io.Encoder;
import org.apache.avro.io.EncoderFactory;
import org.apache.avro.specific.SpecificDatumWriter;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        Example.test();
    }
}
