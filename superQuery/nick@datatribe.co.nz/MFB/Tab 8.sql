select coalesce(ads.product, ga.product) prod, ads.dates ads_dates, ga.dates ga_dates
from
(SELECT 'BBOX' as product, count(distinct date) as dates 
FROM `d3-projects-271420.MFB_extraction.ads_bbox_ext`
where date >= '2020-09-01'
union all
SELECT 'MFB FS' as product, count(distinct date) as dates 
FROM `d3-projects-271420.MFB_extraction.ads_mfb_fs_ext`
where date >= '2020-09-01'
union all
SELECT 'MFB FS' as product, count(distinct date) as dates 
FROM `d3-projects-271420.MFB_extraction.ads_made_ext`
where date >= '2020-09-01') as ads

left join

(SELECT 'BBOX' as product, count(distinct ga_date) as dates 
FROM `d3-projects-271420.MFB_extraction.ga_bbox_ext`
where ga_date like '202009%'
union all
SELECT 'MFB FS' as product, count(distinct ga_date) as dates 
FROM `d3-projects-271420.MFB_extraction.ga_mfb_fs_ext`
where ga_date like '202009%'
union all
SELECT 'MFB FS' as product, count(distinct ga_date) as dates 
FROM `d3-projects-271420.MFB_extraction.ga_made_ext`
where ga_date like '202009%') as ga

on ads.product = ga.product
group by prod, ads_dates, ga_dates