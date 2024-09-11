WITH stg_job_ads AS (SELECT * FROM {{ source('jobads_dbt', 'stg_data_ads') }})

SELECT
    id,
    headline,
    number_of_vacancies AS vacancies,
    relevance,
    application_deadline,
    publication_date AS published_date
FROM stg_job_ads ORDER BY application_deadline ASC