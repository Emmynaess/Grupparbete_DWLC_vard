WITH src_auxiliary_attributes AS (SELECT * FROM {{ ref('src_auxiliary_attributes') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id','experience_required']) }} AS auxiliary_attributes_id, 
    id,
    experience_required,
    COALESCE(driver_license, 'not specified') AS driving_license_required,
    access_to_own_car
FROM src_auxiliary_attributes