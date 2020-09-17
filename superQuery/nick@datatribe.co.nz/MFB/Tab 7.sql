select ga_date
FROM `d3-projects-271420.MFB_extraction.ga_bbox_ext`
where ga_date like '202009%'
group by ga_date