select ga_date
FROM `d3-projects-271420.MFB_extraction.ga_bbox_ext`
where cast(ga_date AS INT64) > 20200600
group by ga_date