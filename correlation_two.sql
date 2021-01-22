DROP VIEW IF EXISTS corr_2_Y;
CREATE VIEW corr_2_Y AS
SELECT device_id, "Tcorr2Y" FROM (SELECT 
		meta21.id, 								
		avg(d.value) AS "mean",				
		corr(d.norm, d19.norm) AS "Tcorr2Y"	
	FROM data_norm d										
	JOIN meta21 on meta21.id = d.meta_id	
	JOIN metadata m19 on meta21.close_meta19_id=m19.id
	JOIN data_norm d19 on m19.id=d19.meta_id 
	     AND d.measurement_index=d19.measurement_index
	GROUP BY meta21.id) AS indices
JOIN metadata ON indices.id=metadata.id
