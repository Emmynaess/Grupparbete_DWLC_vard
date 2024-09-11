# Grupparbete_DWLC_vard

A project for analyzing healthcare job ads using dbt, dlt, snowflake, streamlit

## Snowflake

You need to create your own snowflake account and use the 'setup_wh_and_database' to create the database
Afterwards you can use 'user_and_roles' to create the necessary roles and setup the marts layer
Make sure to change the GRANT to reflect the names of your users and not our example names

## Requirements

Make sure you run a virtual enviroment and install modules from 'requirements.txt' to have everything run correctly

## DBT

Make sure all your users use the same config in '~/.dbt/profiles.yml' to run the project smoothly
This can be by copy and paste our example into it and making sure the details fits your project
Afterwards run 'dbt debug' to make sure everything works correctly. If it does run 'dbt deps' to get packages

## Documentation

To get the documentation on the project run 'dbt docs generate' then 'dbt docs serve'. This will show more details about it