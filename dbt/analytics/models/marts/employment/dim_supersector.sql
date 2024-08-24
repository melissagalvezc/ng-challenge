SELECT
    supersector_code,
    supersector_name
FROM {{ ref('stg_raw__ce_supersector') }}      