DROP VIEW IF EXISTS index_avg_temp;
CREATE VIEW index_avg_temp AS
SELECT device_id,avg(value)
FROM (
    SELECT m.*, d.* 
    FROM data d
    JOIN metadata m ON d.meta_id=m.id
    WHERE d.variable_id = '1'  
    AND m.term_id=11
    ) AS joined
GROUP BY device_id
