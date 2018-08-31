<?php

print("coucou");

$CONFIG = array (
  'objectstore' => array(
    'class' => 'OC\\Files\\ObjectStore\\S3',
    'arguments' => array(
      'bucket' => getenv('S3_BUCKET_NAME'),
      'autocreate' => false,
      'key'    => getenv('S3_BUCKET_KEY'),
      'secret' => getenv('S3_SECRET'),
      'hostname' => getenv('S3_HOSTNAME'),
      'port' => getenv('S3_PORT'),
      'use_ssl' => true,
      'region' => getenv('S3_REGION'),
      // required for some non amazon s3 implementations
      'use_path_style'=>true
    )
  )
);

print("coucou");


?>
