SELECT 
    industry_code,
    naics_code,
    publishing_status,
    industry_name,
    display_level,
    selectable,
    sort_sequence
FROM {{ ref('stg_raw__ce_industry') }}