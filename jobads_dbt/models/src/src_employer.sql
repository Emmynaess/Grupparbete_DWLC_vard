WITH stg_job_ads AS (SELECT * FROM {{ source('jobads_dbt', 'stg_data_ads') }})

SELECT
    id,
    employer__name AS employer_name,
    employer__workplace AS employer_workplace,
    employer__organization_number AS employer_organization_number,
    workplace_address__street_address AS workplace_address,
    workplace_address__region AS workplace_region,
    workplace_address__postcode AS workplace_postcode,
    workplace_address__city AS workplace_city,
    workplace_address__country AS workplace_country
FROM stg_job_ads