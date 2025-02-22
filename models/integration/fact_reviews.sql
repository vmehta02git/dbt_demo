{{config(materialized= 'incremental')}}

SELECT * FROM {{ref('src_reviews')}} WHERE 1=1 
{% if is_incremental() %}
    AND review_date > (SELECT MAX(review_date) FROM {{this}})
{% endif %}
