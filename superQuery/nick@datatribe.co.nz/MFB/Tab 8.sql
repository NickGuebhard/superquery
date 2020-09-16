SELECT 'Ads BBOX' as product, count(distinct date) as dates 
FROM `d3-projects-271420.MFB_extraction.ads_bbox_ext`
where date >= '2020-09-01'
union
SELECT 'Ads MFB FS' as product, count(distinct date) as dates 
FROM `d3-projects-271420.MFB_extraction.ads_mfb_fs_ext`
where date >= '2020-09-01'