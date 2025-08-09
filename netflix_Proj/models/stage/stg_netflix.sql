
WITH updatecasting AS (
    SELECT
       CAST("Show_Id" AS VARCHAR) AS id,
       CAST("Category" AS VARCHAR) AS category,
       CAST("Title" AS VARCHAR) AS title,   
       CAST("Director" AS VARCHAR) AS director,
       CAST("Cast" AS VARCHAR) AS cast, 
       CAST("Country" AS VARCHAR) AS country,
       CAST("Release_Date" AS date) AS releasedate,
       CAST("Rating" AS VARCHAR) AS rating,
       CAST("Duration" AS VARCHAR) AS duration
    FROM
        {{ source('raw', 'NetflixData') }}
)
SELECT * FROM updatecasting