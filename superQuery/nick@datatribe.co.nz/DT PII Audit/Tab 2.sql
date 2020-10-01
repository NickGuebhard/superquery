SELECT * FROM `dt-pii-audit.client_concatenated.skinny`
-- where current_date('Pacific/Auckland') = date(datetime(insertion_date, 'Pacific/Auckland'))
where current_date('Pacific/Auckland') =  parse_date('%Y%m%d',ga_date)
-- where regexp_contains(ga_date, '2020090(7|8|9)')