SELECT parse_date('%Y%m%d',ga_date) as y FROM `dt-pii-audit.client_concatenated.skinny`
-- where current_date('Pacific/Auckland') = date(datetime(insertion_date, 'Pacific/Auckland'))
-- where regexp_contains(ga_date, '2020090(7|8|9)')
group by y