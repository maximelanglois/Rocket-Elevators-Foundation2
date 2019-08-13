SELECT to_char(creation_date, 'Month') AS Month, to_char(creation_date, 'YYYY') AS "Year",COUNT(*) FROM dim_customers group by 1, 2
