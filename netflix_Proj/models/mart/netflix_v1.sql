
WITH main AS
(
SELECT 
    t1.id,
    t1.category,
    t1.title,
    t1.director,
    t1.cast,
    t1.country,
    t1.release_date,
    t1.rating,
    t1.duration_min,
    t1.duration_season

FROM {{ ref('int_netflix') }} AS t1

)

SELECT * FROM Main