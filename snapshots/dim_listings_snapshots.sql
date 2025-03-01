{% snapshot listing_snapshots %}
{{ 
    config(
        target_database='int',
        target_schema='snapshot',
        target_table='dim_listings_snapshots',
        unique_key='listing_id',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_delete='true',
        tags=['snapshot']
    )
}}

SELECT
id AS listing_id, name AS listing_name, listing_url, room_type, minimum_nights, host_id,
price AS price_str, created_at, updated_at
FROM {{source('raw_airbnb', 'listings')}}

{% endsnapshot %}