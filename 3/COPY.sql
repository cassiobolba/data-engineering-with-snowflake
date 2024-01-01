LIST @OPEN_DATA.NOAA.NOAA_STAGE;
--s3://noaa-swpc-pds/json/goes/primary/magnetometers-7-day.json

SELECT $1
FROM @OPEN_DATA.NOAA.NOAA_STAGE/json/goes/primary/magnetometers-7-day.json;

CREATE TABLE IF NOT EXISTS OPEN_DATA.NOAA.MAGNETOMETERS_7_DAYS_RAW (
    JSON_RAW VARIANT
);

COPY INTO OPEN_DATA.NOAA.MAGNETOMETERS_7_DAYS_RAW
    FROM @OPEN_DATA.NOAA.NOAA_STAGE/json/goes/primary/magnetometers-7-day.json
    FILE_FORMAT = ( TYPE = 'json')
    --PATTERNS = '.*json'
    --ON_ERROR = 'CONTINUE'
    ;

SELECT * FROM MAGNETOMETERS_7_DAYS_RAW;
