{% snapshot hosts_snapshots %}
{{
 config(
    target_database='int',
    target_schema='snapshot',
    unique_key='id',
    strategy='timestamp',
    updated_at='updated_at',
    invalidate_hard_deletes=True
 )
}}
select * FROM {{ source('raw_airbnb', 'hosts') }}
{% endsnapshot %}