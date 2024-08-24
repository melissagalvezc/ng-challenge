SELECT
    period,
    mm,
    month
FROM {{ ref('stg_raw__ce_period') }}    