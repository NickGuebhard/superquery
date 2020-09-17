SELECT COUNT(DISTINCT Date ) as days, EXTRACT(YEAR from Date), date as year
FROM `d3-projects-271420.MFB_extraction.ads_bbox_ext`
where date between '2020-06-01' and '2020-06-30'
group by date