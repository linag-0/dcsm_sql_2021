DROP VIEW IF EXISTS index_day;
CREATE VIEW index_day AS
SELECT device_id, 
avg(value) AS t_d
FROM (
    SELECT *,
    CASE WHEN stunde > '18' OR stunde <= '6' THEN 'n'
        ELSE 'd' END  
        AS daynight
    FROM (
        SELECT m.*, d.*,extract(hour FROM d.tstamp) AS stunde 
        FROM data d
        JOIN metadata m ON d.meta_id=m.id
        WHERE d.variable_id = '1'  AND
        m.term_id=11) AS joined
) AS w_daytime
WHERE daynight='d'
GROUP BY device_id
ORDER BY device_id