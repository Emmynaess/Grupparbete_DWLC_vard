WITH src_job_details AS (SELECT * FROM {{ ref('src_job_details') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id','headline']) }} AS job_details_id, 
    COALESCE(headline, 'Headline missing') AS headline,
    COALESCE(description, 'Description missing') AS description,
    COALESCE(description_html_formatted, 'HTML description missing') AS description_html_formatted,
    COALESCE(employment_type, 'Type not specified') AS employment_type,
    COALESCE(duration, 'Duration not specified') AS duration,
    COALESCE(salary_type, 'Type not specified') AS salary_type,
    scope_of_work_min,
    scope_of_work_max,
    COALESCE(occupation_label, 'Type not specified') as occupation_label
FROM src_job_details