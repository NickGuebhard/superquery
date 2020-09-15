SELECT COUNT(DISTINCT date_start ) as days, EXTRACT(YEAR from date_start) as year
FROM `d3-projects-271420.MFB_extraction.fb_made_ext`
group by year