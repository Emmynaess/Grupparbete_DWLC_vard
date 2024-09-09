USE ROLE SYSADMIN;

USE DATABASE job_ads_healthcare_db;

CREATE SCHEMA IF NOT EXISTS marts;

USE ROLE securityadmin;

GRANT USAGE,
CREATE TABLE,
CREATE VIEW ON SCHEMA job_ads_healthcare_db.marts TO ROLE job_ads_dbt_health_role;

GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA job_ads_healthcare_db.marts TO ROLE job_ads_reporter_health_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA job_ads_healthcare_db.marts TO ROLE job_ads_reporter_health_role;

-- grant CRUD and select on future tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA job_ads_healthcare_db.marts TO ROLE job_ads_reporter_health_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads_healthcare_db.marts TO ROLE job_ads_reporter_health_role;