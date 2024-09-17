# Grupparbete_DWLC_vard

A project for analyzing healthcare job ads using dbt, dlt, snowflake, and streamlit.

## Snowflake

You need to create your own snowflake account and use the `setup_wh_and_database` to create the database.
Afterwards you can use `user_and_roles` to create the necessary roles and setup the marts layer.
Make sure to change the GRANT to reflect the names of your users and not our example names.

## Requirements

Make sure you run a virtual environment and install modules from `requirements.txt` to have everything run correctly.

## dlt

To get dlt working after cloning you need to create a `secrets.toml`-file in the `.dlt` subfolder in the `extract-from-api` directory. The file should contain credentials to the user `extract_loader`.

```text
[destination.snowflake.credentials]
database = "<database_name>" # please set me up!
password = "<password_for_extract_loader_user>" # please set me up!
username = "<username_for_extract_loader>" # please set me up!
host = "<account_locator.cloud_region_id.cloud>" # the part of the account-url that comes before ".snowflakecomputing.com"
warehouse = "<warehouse name>" # please set me up!
role = "<dlt_role_granted_to_extract_loader_user>" # please set me up!
```

After that navigate to folder `extract-from-api`in terminal and run `dlt init healthcare_job_ads snowflake`.

## DBT

Make sure all your users use the same config in `~/.dbt/profiles.yml` to run the project smoothly.
This can be by copy and paste our example into it and making sure the details fits your project.
Afterwards run `dbt debug` to make sure everything works correctly. If it does run 'dbt deps' to get packages.

## Documentation

To get the documentation on the project run `dbt docs generate` then `dbt docs serve`. This will show more details about it.

## Dashboard

To be run the dashboard you need to add a `.env` file with filled in credentials inside the `streamlit_dashboard`folder.
Here are the credentials that you will need to fill in.

```txt
SNOWFLAKE_USER = <insert reporter user's username>
SNOWFLAKE_PASSWORD = <insert password>
SNOWFLAKE_ACCOUNT = <insert account_locator.cloud_region_id.cloud - the part of the account-url that comes before ".snowflakecomputing.com">
SNOWFLAKE_WAREHOUSE = <insert warehouse name>
SNOWFLAKE_DATABASE = <insert database name>
SNOWFLAKE_SCHEMA = <insert schema>
SNOWFLAKE_ROLE = <insert the role that was created for the reporter user>
```

After you are done with `.env`file and saved it, you can run `run_dashboard.py`. The script should open a browser window that contains the dashboard, `localhost:8501` as URL. Enjoy!
