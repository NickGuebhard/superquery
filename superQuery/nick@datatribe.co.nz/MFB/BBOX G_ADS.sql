SELECT COUNT(DISTINCT Date ) as days, EXTRACT(YEAR from Date) as year
FROM `d3-projects-271420.MFB_extraction.ads_bbox_ext`
where date >= '2020-05-01'
group by date