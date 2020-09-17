select date_start
FROM `d3-projects-271420.MFB_extraction.fb_bbox_ext`
where date_start >= '2020-06-01'
group by date_start