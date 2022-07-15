SELECT
COUNT(CASE WHEN datedebcad < '2021-10-20' THEN 1 END) AS Expired,
COUNT(CASE WHEN datedebcad <= '2021-10-25' AND datedebcad >= '2021-10-20' THEN 1 END) AS will_expire_in_5_days,
COUNT(CASE WHEN datedebcad > '2021-10-25' THEN 1 END) AS safe
FROM new_table
GROUP BY libellérayon
