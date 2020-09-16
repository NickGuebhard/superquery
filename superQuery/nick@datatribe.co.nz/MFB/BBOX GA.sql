SELECT COUNT(DISTINCT ga_date) as days, SUBSTR(ga_date, 0, 4) as year
FROM `d3-projects-271420.MFB_extraction.ga_bbox_ext`
group by year