SELECT 
    series_id,
    supersector_code,
    industry_code,
    data_type_code,
    seasonal,
    series_title
 FROM  {{ ref('stg_raw__ce_series') }}  
