WITH src_auxiliary_attributes AS (SELECT * FROM {{ ref('src_auxiliary_attributes') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id','experience_required']) }} AS auxiliary_attributes_id,
    COALESCE(experience_required, FALSE) AS experience_required,
    COALESCE(driver_license, FALSE) AS driving_license_required,
    COALESCE(access_to_own_car, FALSE) AS access_to_own_car
FROM src_auxiliary_attributes