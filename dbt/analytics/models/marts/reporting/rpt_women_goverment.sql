SELECT 
    concat(trim(dim_period.month),' ',all_series.Year) AS DATE,
    sum(all_series.Value)                              AS VALUE,
FROM {{ ref('fct_all_series') }} all_series
LEFT JOIN {{ ref('dim_series') }} series
    ON all_series.series_id=series.series_id    
LEFT JOIN {{ ref('dim_datatype') }} datatype
    ON series.data_type_code=datatype.data_type_code
LEFT JOIN {{ ref('dim_period') }} dim_period
    ON dim_period.period=all_series.period
LEFT JOIN {{ ref('dim_industry') }} dim_industry    
    ON dim_industry.industry_code=series.industry_code
WHERE datatype.data_type_code=10
AND dim_industry.industry_code =90000000
AND dim_period.MM NOT IN ( 'AN AV')
GROUP BY all