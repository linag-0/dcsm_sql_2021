-- Template for creating the final view
DROP VIEW IF EXISTS temperature_indices;
CREATE VIEW temperature_indices AS
SELECT iat.*, tn.t_n, td.t_d, td.t_d-tn.t_n AS t_nd, 
       cone."Tcorr1Y", ctwo."Tcorr2Y" 
FROM index_avg_temp AS iat
JOIN index_night tn ON iat.device_id = tn.device_id
JOIN index_day td ON iat.device_id= td.device_id
JOIN corr_1_Y cone ON iat.device_id= cone.device_id
JOIN corr_2_Y ctwo ON iat.device_id= ctwo.device_id