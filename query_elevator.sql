SELECT to_char(commissionning_date, 'Month') AS Month, to_char(commissionning_date, 'YYYY') AS "Year",COUNT(*) FROM fact_elevators group by 1, 2