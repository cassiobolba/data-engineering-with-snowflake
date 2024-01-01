SELECT DISTINCT
    RAW_FILE:id id
    ,array_size(RAW_FILE:multiMedia) size
FROM SOCIAL_MEDIAS.YOUTUBE.STATISTICS_RAW;

SELECT DISTINCT
     raw_file:id::int as id
    ,raw_file:createdAt as createdAt
    ,raw_file:description::string as description
    ,raw_file:likeDislike.dislikes as dislikes
    ,raw_file:likeDislike.likes as likes
    ,raw_file:likeDislike.userAction as userAction
    ,f.value:id as multiMedia_id
FROM SOCIAL_MEDIAS.YOUTUBE.STATISTICS_RAW ,
table(flatten(raw_file:multiMedia)) f
--where raw_file:id::int = 2114
;
