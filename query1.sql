SELECT COUNT(EAN) as ean_count
FROM new_table
LEFT JOIN in_shop
ON new_table.EAN=in_shop.reference_id
WHERE in_shop.reference_id is NULL;
