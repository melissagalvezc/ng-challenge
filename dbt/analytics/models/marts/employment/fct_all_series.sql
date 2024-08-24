SELECT
    series_id,
    year,
    period,
    value,
    footnote_codes
FROM  {{ ref('stg_raw__ce_data_0_all_cesseries') }}   