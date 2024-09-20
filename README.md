# Grupparbete_DWLC_vard

A project for analyzing healthcare job ads using dbt, dlt, snowflake, and streamlit.

## Snowflake

You need to create your own snowflake account and use the `setup_wh_and_database` to create the database.
Afterwards you can use `user_and_roles` to create the necessary roles and setup the marts layer.
Make sure to change the GRANT to reflect the names of your users and not our example names.

## Virtual environment and requirements

Make sure you run a virtual environment. For this project `uv`was used for virtual environment. If you haven't used `uv` before you can install it by running

```bash
pip install uv
```

Navigate to the main project folder and run command `uv venv`to create a virtual environment. Activate venv by running

```bash
source .venv/Scripts/activate
```

Run `uv pip install -r requirements.txt` to install all needed modules to have everything run correctly.

## dlt

To get dlt working after cloning you need to create a `secrets.toml`-file in the `.dlt` subfolder in the `extract-from-api` directory. The file should contain credentials to the user `extract_loader`.

```toml
[destination.snowflake.credentials]
database = "<database_name>" 
password = "<password_for_extract_loader_user>" 
username = "<username_for_extract_loader>"
host = "<account_locator.cloud_region_id.cloud>" # the part of the account-url that comes before ".snowflakecomputing.com"
warehouse = "<warehouse name>" 
role = "<dlt_role_granted_to_extract_loader_user>" 
```

You should now be able to run the pipeline by executing the `healthcare_job_ads.py`file.

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
