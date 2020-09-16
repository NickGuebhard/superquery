SELECT ga_date, count(ga_date)
FROM `d3-projects-271420.MFB_extraction.ga_bbox_ext`
group by ga_date