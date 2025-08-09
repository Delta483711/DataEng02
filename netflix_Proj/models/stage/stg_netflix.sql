
WITH UpdateCasting AS (
    SELECT
       cast("Show_Id" AS varchar) as id,
       cast("Category" as varchar) as category,
       cast("Title" as varchar) as title,   
       cast("Director" as varchar) as director,
       cast("Cast" as varchar) as cast, 
       cast("Country" as varchar) as country,
       cast("Release_Date" AS date) as releasedate,
       cast("Rating" as varchar) as rating,
       cast("Duration" as varchar) as duration
    FROM
        {{ source('raw', 'NetflixData') }}
)
SELECT * FROM UpdateCasting