
WITH updt2 AS
(

SELECT
    CAST(TRIM(t1.id, 's') AS INT ) AS id,
    t1.category,
    COALESCE(t1.title,'Untitled') AS title,
    COALESCE(t1.director,'N/A') AS director,
    COALESCE(t1.cast,'N/A') AS cast,
    COALESCE(t1.country,'N/A') AS country,
    t1.releasedate AS release_date,
    t1.rating,
    CASE
        WHEN t1.duration ilike '%min%'
            THEN CAST(regexp_replace(t1.duration, '[^0-9]', '', 'g') AS INT)
        END AS duration_min,
    CASE
        WHEN t1.duration ilike '%season%'
            THEN CAST(regexp_replace(t1.duration, '[^0-9]', '', 'g') AS INT)
        END AS duration_season
FROM
    {{ ref('stg_netflix') }} AS t1

),

UpdateDuration AS
(
    SELECT
        t2.id,
        t2.category,
        t2.title,
        t2.director,
        t2.cast,
        t2.country,
        t2.release_date,
        t2.rating,
        COALESCE(t2.duration_min,0) as duration_min,
        COALESCE(t2.duration_season,0) as duration_season
    FROM
        updt2 t2
)


SELECT * FROM UpdateDuration