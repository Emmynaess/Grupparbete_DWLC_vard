
-- DBT ROLE

USE ROLE USERADMIN;
CREATE ROLE IF NOT EXISTS job_ads_dbt_health_role;

USE ROLE SECURITYADMIN;

GRANT ROLE job_ads_dlt_health_role TO ROLE job_ads_dbt_health_role;

SHOW GRANTS TO ROLE job_ads_dbt_health_role;

GRANT USAGE,
CREATE TABLE,
CREATE VIEW ON SCHEMA job_ads_healthcare_db.warehouse TO ROLE job_ads_dbt_health_role;

-- grant CRUD and select tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA job_ads_healthcare_db.warehouse TO ROLE job_ads_dbt_health_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA job_ads_healthcare_db.warehouse TO ROLE job_ads_dbt_health_role;

-- grant CRUD and select on future tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA job_ads_healthcare_db.warehouse TO ROLE job_ads_dbt_health_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads_healthcare_db.warehouse TO ROLE job_ads_dbt_health_role;

SHOW GRANTS ON SCHEMA job_ads_healthcare_db.warehouse;

GRANT ROLE job_ads_dbt_health_role TO USER transformer_health;
GRANT ROLE job_ads_dbt_health_role TO USER Emmynaess;
GRANT ROLE job_ads_dbt_health_role TO USER Larissa_D;
GRANT ROLE job_ads_dbt_health_role TO USER Anton_B;