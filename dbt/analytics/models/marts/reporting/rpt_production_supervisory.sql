SELECT 
    concat(trim(dim_period.month),' ',all_series.Year) AS DATE,
    sum(CASE WHEN series.data_type_code=1  THEN all_series.Value  ELSE 0 END ) AS production_value,
    production_value- sum(CASE WHEN series.data_type_code=6  THEN all_series.Value ELSE 0 END ) AS supervisory_value,
    div0(supervisory_value,production_value) AS ratio
FROM {{ ref('fct_all_series') }} all_series
LEFT JOIN {{ ref('dim_series') }} series
    ON all_series.series_id=series.series_id    
LEFT JOIN {{ ref('dim_datatype') }} datatype
    ON series.data_type_code=datatype.data_type_code
LEFT JOIN {{ ref('dim_period') }} dim_period
    ON dim_period.period=all_series.period
WHERE  dim_period.MM NOT IN ( 'AN AV')    
GROUP BY all