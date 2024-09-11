WITH ja AS (SELECT * FROM {{ ref('src_job_ads') }}),

jd AS (SELECT * FROM {{ ref('src_job_details') }}),

e AS (SELECT * FROM {{ ref('src_employer') }}),



SELECT 
    {{dbt_utils.generate_surrogate_key(['jd.id', 'jd.headline'])}} as job_details_key,
    {{dbt_utils.generate_surrogate_key(['e.id', 'e.employer_name'])}} as employer_key,

