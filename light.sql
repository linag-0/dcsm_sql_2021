SELECT avg(licht) FROM (
    SELECT *, 
    cast(value AS numeric) AS licht
    FROM raw_data 
    WHERE meta_id = 
            (SELECT DISTINCT id 
            FROM metadata 
            WHERE device_id='10347320' LIMIT 1) 
        AND variable_id = '2'
    ) AS mean
WHERE licht > '0' AND tstamp < '2020-12-21T00:00:00';

SELECT hm, avg(licht) FROM(
    SELECT *,
        value AS licht, 
        extract(hour FROM tstamp) || ':'|| extract(minute FROM tstamp)  
            AS hm
    FROM raw_data
    WHERE variable_id = '2' 
        AND meta_id = (SELECT DISTINCT id 
            FROM metadata 
            WHERE device_id='10347320' LIMIT 1)
) AS hminfo
WHERE tstamp BETWEEN '2020-11-30T00:00' AND '2020-12-20T23:50'
GROUP BY hm
ORDER BY avg DESC