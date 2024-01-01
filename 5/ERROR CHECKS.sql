-- Validate pipe is actually working
SELECT SYSTEM$PIPE_STATUS('YOUTUBE_PIPE');

-- Snowpipe error message
-- sometime can give some general error message
SELECT * FROM TABLE(VALIDATE_PIPE_LOAD(
    PIPE_NAME => 'YOUTUBE_PIPE',
    START_TIME => DATEADD(HOUR,-10,CURRENT_TIMESTAMP())));

-- COPY command history from table to see error massage
-- here we have more details to understand the error
SELECT * FROM TABLE(INFORMATION_SCHEMA.COPY_HISTORY(
   TABLE_NAME  =>  'STATISTICS_RAW',
   START_TIME => DATEADD(HOUR,-10,CURRENT_TIMESTAMP())))
   -- END_TIME => 
   ;

-- Pause pipes
ALTER PIPE YOUTUBE_PIPE SET PIPE_EXECUTION_PAUSED = true;
