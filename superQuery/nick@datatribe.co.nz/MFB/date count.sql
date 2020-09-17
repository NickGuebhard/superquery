select ga.product as product, ga.platform as platform, ga.mth as mth, sum(ga.transactions) as transactions, sum(ads.total_cost) as ads_cost, sum(fb.total_cost) as fb_cost
from

(SELECT 'BBOX' as product, sum(ga_transactions) as transactions, 'Google Analytics' as platform, substr(ga_date, 4, 2) as mth --count(distinct ga_date) as dates 
FROM `d3-projects-271420.MFB_extraction.ga_bbox_ext`
where ga_date like '2020%'
group by ga_date
union all
SELECT 'MFB FS' as product, sum(ga_transactions) as transactions,'Google Analytics' as platform, substr(ga_date, 4, 2) as mth --count(distinct ga_date) as dates 
FROM `d3-projects-271420.MFB_extraction.ga_mfb_fs_ext`
where ga_date like '2020%'
group by ga_date
union all
SELECT 'MADE' as product, sum(ga_transactions) as transactions, 'Google Analytics' as platform, substr(ga_date, 4, 2) as mth --count(distinct ga_date) as dates 
FROM `d3-projects-271420.MFB_extraction.ga_made_ext`
where ga_date like '2020%'
group by ga_date) as ga


left join

(SELECT 'BBOX' as product, sum(cost) as total_cost, 'Google Ads' as platform, substr(cast(date as string), 5, 2) as mth --count(distinct date) as dates 
FROM `d3-projects-271420.MFB_extraction.ads_bbox_ext`
where date >= '2020-01-01'
group by date
union all
SELECT 'MFB FS' as product, sum(cost) as total_cost, 'Google Ads' as platform, substr(cast(date as string), 5, 2) as mth --count(distinct date) as dates 
FROM `d3-projects-271420.MFB_extraction.ads_mfb_fs_ext`
where date >= '2020-01-01'
group by date
union all
SELECT 'MADE' as product, sum(cost) as total_cost, 'Google Ads' as platform, substr(cast(date as string), 5, 2) as mth --count(distinct date) as dates 
FROM `d3-projects-271420.MFB_extraction.ads_made_ext`
where date >= '2020-01-01'
group by date) as ads

on ga.product = ads.product and ga.platform = ads.platform

left JOIN

(SELECT 'BBOX' as product, sum(spend) as total_cost, 'Facebook Ads' as platform, substr(cast(date_start as string), 5, 2) as mth --, count(distinct date_start) as dates 
FROM `d3-projects-271420.MFB_extraction.fb_bbox_ext`
where date_start >= '2020-01-01'
group by date_start
union all
SELECT 'MFB FS' as product, sum(spend) as total_cost, 'Facebook Ads' as platform, substr(cast(date_start as string), 5, 2) as mth--, count(distinct date_start) as dates 
FROM `d3-projects-271420.MFB_extraction.fb_mfb_fs_ext`
where date_start >= '2020-01-01'
group by date_start
union all
SELECT 'MADE' as product, sum(spend) as total_cost, 'Facebook Ads' as platform, substr(cast(date_start as string), 5, 2) as mth--, count(distinct date_start) as dates 
FROM `d3-projects-271420.MFB_extraction.fb_made_ext`
where date_start >= '2020-01-01'
group by date_start) as fb

on ga.product = fb.product and ga.platform = fb.platform

group by product, platform, mth