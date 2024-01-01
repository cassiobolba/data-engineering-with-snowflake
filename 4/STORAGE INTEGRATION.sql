--arn:aws:iam::749634257170:role/snowflake-role

CREATE DATABASE SOCIAL_MEDIAS;
CREATE SCHEMA YOUTUBE;

CREATE OR REPLACE STORAGE INTEGRATION AWS_S3_INT
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE 
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::749634257170:role/snowflake-role'
  STORAGE_ALLOWED_LOCATIONS = ('s3://sf-lake/')
  --STORAGE_BLOCKED_LOCATIONS = ('s3://mybucket3/path3/', 's3://mybucket4/path4/');
  COMMENT = 'Integration to AWS s3' ;

-- AZURE EXAMPLE
-- CREATE STORAGE INTEGRATION AZURE_BLOB_INT
--   TYPE = EXTERNAL_STAGE
--   STORAGE_PROVIDER = 'AZURE'
--   ENABLED = TRUE
--   AZURE_TENANT_ID = ''
--   STORAGE_ALLOWED_LOCATIONS = ('*')
--   STORAGE_BLOCKED_LOCATIONS = ('azure://myaccount.blob.core.windows.net/mycontainer/path3/');

SHOW  INTEGRATIONS;

DESC INTEGRATION AWS_S3_INT;
