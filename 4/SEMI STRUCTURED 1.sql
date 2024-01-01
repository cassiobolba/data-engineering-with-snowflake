SELECT * FROM SOCIAL_MEDIAS.YOUTUBE.STATISTICS_RAW;

SELECT 
     $1:id::int as id
    ,$1:createdAt as createdAt
    ,$1:description::string as description
    ,$1:likeDislike as likeDislike
FROM SOCIAL_MEDIAS.YOUTUBE.STATISTICS_RAW;
