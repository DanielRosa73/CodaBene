CREATE TABLE in_shop (expiry_date DATE, reference_id INT8, control_timestamp TIMESTAMPTZ, allee VARCHAR(150))
;

copy in_shop(expiry_date, reference_id, control_timestamp, allee) from '/home/benchovski/CodaBene/in_shop.csv' delimiter ';' CSV HEADER;

