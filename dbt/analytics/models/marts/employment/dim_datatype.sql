SELECT
      data_type_code, 
      data_type_text
FROM {{ ref('stg_raw__ce_datatype') }}