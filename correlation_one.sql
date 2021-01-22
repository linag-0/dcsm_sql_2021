DROP VIEW IF EXISTS corr_1_Y;
CREATE VIEW corr_1_Y AS
SELECT device_id, "Tcorr1Y" FROM (SELECT 
		meta21.id, 								
		avg(d.value) AS "mean",				
		corr(d.norm, d20.norm) AS "Tcorr1Y"	
	FROM data_norm d										
	JOIN meta21 on meta21.id = d.meta_id	
	JOIN metadata m20 on meta21.close_meta20_id=m20.id
	JOIN data_norm d20 on m20.id=d20.meta_id 
	     AND d.measurement_index=d20.measurement_index
	GROUP BY meta21.id) AS indices
JOIN metadata ON indices.id=metadata.id
