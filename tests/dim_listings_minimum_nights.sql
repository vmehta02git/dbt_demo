select * from 
{{ref('dim_listings')}}
where minimum_nights <1
limit 10

