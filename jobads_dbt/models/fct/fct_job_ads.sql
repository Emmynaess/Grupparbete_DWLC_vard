WITH job_ads AS (SELECT * FROM {{ ref('src_job_ads') }}),
job_details AS (SELECT * FROM {{ ref('src_job_details') }}),
employer AS (SELECT * FROM {{ ref('src_employer') }}),
auxiliary_attributes AS (SELECT * FROM {{ ref('src_auxiliary_attributes') }})

SELECT 
    {{dbt_utils.generate_surrogate_key(['job_ads.id', 'job_ads.headline'])}} as job_details_key,
    {{dbt_utils.generate_surrogate_key(['job_details.id', 'job_details.headline'])}} as job_ads_key,
    {{dbt_utils.generate_surrogate_key(['employer.id', 'employer.employer_name'])}} as employer_key,
    {{dbt_utils.generate_surrogate_key(['auxiliary_attributes.id', 'auxiliary_attributes.experience_required']) }} AS auxiliary_attributes_key,

    relevance,
    coalesce(vacancies, 1) as vacancies,
    application_deadline,
    publishing_date

FROM 
    job_ads 
LEFT JOIN 
    job_details ON job_ads.id = job_details.id
LEFT JOIN 
    employer ON job_ads.id = employer.id
LEFT JOIN 
    auxiliary_attributes ON job_ads.id = auxiliary_attributes.id


