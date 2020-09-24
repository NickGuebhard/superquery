SELECT COUNT(DISTINCT date_start ) as days, EXTRACT(YEAR from date_start), date_start as year
FROM `d3-projects-271420.MFB_extraction.fb_bbox_ext`
where date_start between '2020-09-01' and '2020-09-30'
group by date_start
order by date_start