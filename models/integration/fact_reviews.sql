{{
    config(
        materialized='incremental'
        )
}}
SELECT *
FROM
    {{ ref('src_reviews') }}
WHERE review_text IS NOT NULL
{% if is_incremental() %}
    AND review_date > (select max(review_date) from {{ this }})
{% endif %}

