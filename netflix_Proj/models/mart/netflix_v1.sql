
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
    t1.duration_season,
    COUNT(CASE WHEN t1.category = 'Movie' THEN 1 ELSE NULL END) AS total_movie_count,
    COUNT(CASE WHEN t1.category = 'TV Show' THEN 1 ELSE NULL END) AS total_tv_show_count

FROM {{ ref('int_netflix') }} AS t1
GROUP BY 
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
)

SELECT * FROM Main