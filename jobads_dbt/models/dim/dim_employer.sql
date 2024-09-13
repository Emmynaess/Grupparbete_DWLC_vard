WITH src_employer AS (SELECT * FROM {{ ref('src_employer') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id', 'employer_name']) }} AS employer_id,
    employer_name,
    COALESCE(employer_workplace, 'Workplace not specified') AS employer_workplace,
    COALESCE(employer_organization_number, 'Organization number not specified') AS employer_organization_number,
    {{ capitalize_first_letter("COALESCE(workplace_address, 'Street address not specified')") }} AS workplace_street_address,
    {{ capitalize_first_letter("COALESCE(workplace_region, 'Region not specified')") }} AS workplace_region,
    COALESCE(workplace_postcode, 'Postcode not specified') AS workplace_postcode,
    {{ capitalize_first_letter("coalesce(workplace_city, 'City not specified')") }} AS workplace_city,
    {{ capitalize_first_letter("COALESCE(workplace_country, 'Country not specified')") }} AS workplace_country

FROM src_employer