{% docs __overview__ %}

# # Healthcare Job Ad Project

Here information about the project will be shown

## Dimensional model

![Dimensional model](assets/job_ads_health_dimension_modell.png)

- scope_of_work_min and scope_of_work_max (dim_job_details)
These fields represent the minimum and maximum scope of work, typically in percentage terms for a job and defines the range of working hours, e.g., 50%-100%

- occupation_label (dim_job_details)
This field refers for the type of occupation associated with a job under a specific occupation category or title.

- relevance (fct_job_ads)
This field represents a score or ranking that indicates how closely a job matches certain criteria, such as user preferences, search terms or job-seeker profiles.

- employer_name (dim_employer)
his field represents the official name of the employer or organization offering the job, associated with the job ad.

## Macros overview

Here a short explanation of all macros will be shown

We will describe two macros used in the system for generation schema names and formatting column values. These macros help standardize operations and reduce redundancy in SQL code:

- `generate_schema_name(custom_schema_name, node)`
This macro generates a schema name based on a user-specified schema name or falls back to a default schema if none is provided. 

- `generate_schema_name(custom_schema', node)`
This macro capitalizes the first letter of the value in a given column, while ensuring that null values remain unchanged.

## Tests overview

Here a short explanation of what tests are implemented will be shown

In the schema.yml file:

We have tested whether the data type is correct, checked for null values, and verified if the values are accurate overall


{% enddocs %}
