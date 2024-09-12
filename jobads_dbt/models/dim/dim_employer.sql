WITH src_employer AS (SELECT * FROM {{ ref('src_employer') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id', 'employer_name']) }} AS employer_id,
    employer_name,
    COALESCE(employer_workplace, 'workplace not specified') AS employer_workplace,
    COALESCE(employer_organization_number, 'organization number not specified') AS employer_organization_number,
    COALESCE(workplace_address, 'street address not specified') AS workplace_street_address,
    COALESCE(workplace_region, 'region not specified') AS workplace_region,
    COALESCE(workplace_postcode, 'postcode not specified') AS workplace_postcode,
    {{ capitalize_first_letter("coalesce(workplace_city, 'city not specified')") }} AS workplace_city,
    COALESCE(workplace_country, 'country not specified') AS workplace_country

FROM src_employer