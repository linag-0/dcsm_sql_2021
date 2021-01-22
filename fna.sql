SELECT *, 
cast(menge AS double precision)/504 AS f_na 
FROM (
    SELECT device_id,quality_flag_id, 
    count(*) AS menge
    FROM (
        SELECT m.*, d.* 
        FROM data d
        JOIN metadata m ON d.meta_id=m.id
        WHERE d.variable_id = '1'  
            AND m.term_id=7) AS joined
        GROUP BY device_id, quality_flag_id
    ) AS counting
WHERE quality_flag_id = '1'