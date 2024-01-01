SELECT * FROM OPEN_DATA.NOAA.MAGNETOMETERS_7_DAYS_RAW;

SELECT JSON_RAW[0] FROM OPEN_DATA.NOAA.MAGNETOMETERS_7_DAYS_RAW;

SELECT elements.value, elements.seq FROM OPEN_DATA.NOAA.MAGNETOMETERS_7_DAYS_RAW
, LATERAL FLATTEN ( input => JSON_RAW ) elements
;

CREATE TABLE OPEN_DATA.NOAA.MAGNETOMETERS_7_DAYS AS
SELECT
     elements.value:He AS He
    ,elements.value:Hn AS Hn
    ,elements.value:Hp AS Hp
    ,elements.value:arcjet_flag AS arcjet_flag
    ,elements.value:satellite AS satellite
    ,elements.value:time_tag AS time_tag
    ,elements.value:total AS total
FROM OPEN_DATA.NOAA.MAGNETOMETERS_7_DAYS_RAW
, LATERAL FLATTEN ( input => JSON_RAW ) elements
;
