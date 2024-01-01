SELECT * FROM SOCIAL_MEDIAS.YOUTUBE.STATISTICS_RAW;

SELECT DISTINCT
     $1:id::int as id
    ,$1:createdAt as createdAt
    ,$1:description::string as description
    ,$1:likeDislike.dislikes as dislikes
    ,$1:likeDislike.likes as likes
    ,$1:likeDislike.userAction as userAction
    ,$1:multiMedia[0].name::string as name
FROM SOCIAL_MEDIAS.YOUTUBE.STATISTICS_RAW
where $1:id::int = 2134
union all
SELECT DISTINCT
     $1:id::int as id
    ,$1:createdAt as createdAt
    ,$1:description::string as description
    ,$1:likeDislike.dislikes as dislikes
    ,$1:likeDislike.likes as likes
    ,$1:likeDislike.userAction as userAction
    ,$1:multiMedia[1].name::string as name
FROM SOCIAL_MEDIAS.YOUTUBE.STATISTICS_RAW
where $1:id::int = 2134
;
