CREATE PIPE SOCIAL_MEDIAS.YOUTUBE.YOUTUBE_PIPE
    AUTO_INGEST = TRUE
    -- ERROR_INTEGRATION = -- Required only when configuring Snowpipe to send error notifications to a cloud messaging service.
    -- AWS_SNS_TOPIC = ''
    -- INTEGRATION = '' -- Required only when configuring AUTO_INGEST for Google Cloud Storage or Microsoft Azure stages.
    COMMENT = 'Pipe to autoingest youtube data from S3'
AS
    COPY INTO SOCIAL_MEDIAS.YOUTUBE.STATISTICS_RAW
        FROM @SOCIAL_MEDIAS.YOUTUBE.YOUTUBE_STG
        file_format= SOCIAL_MEDIAS.YOUTUBE.JSON_FMT
        --files = ('youtube_data.json')
        --ON_ERROR = 
        ;

DESC PIPE SOCIAL_MEDIAS.YOUTUBE.YOUTUBE_PIPE;

SELECT * FROM SOCIAL_MEDIAS.YOUTUBE.STATISTICS_RAW;

TRUNCATE TABLE SOCIAL_MEDIAS.YOUTUBE.STATISTICS_RAW;
