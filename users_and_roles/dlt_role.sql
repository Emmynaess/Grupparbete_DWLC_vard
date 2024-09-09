-- DLT ROLE
USE ROLE USERADMIN;
 
CREATE ROLE IF NOT EXISTS job_ads_dlt_health_role;

USE ROLE SECURITYADMIN;


GRANT ROLE job_ads_dlt_health_role TO USER loader_extract;

GRANT USAGE ON WAREHOUSE care_wh TO ROLE job_ads_dlt_health_role;
GRANT USAGE ON DATABASE job_ads_healthcare_db TO ROLE job_ads_dlt_health_role;
GRANT USAGE ON SCHEMA job_ads_healthcare_db.staging TO ROLE job_ads_dlt_health_role;
GRANT CREATE TABLE ON SCHEMA job_ads_healthcare_db.staging TO ROLE job_ads_dlt_health_role;
GRANT INSERT,
UPDATE,
SELECT,
DELETE ON ALL TABLES IN SCHEMA job_ads_healthcare_db.staging TO ROLE job_ads_dlt_health_role;
GRANT INSERT,
UPDATE,
SELECT,
DELETE ON FUTURE TABLES IN SCHEMA job_ads_healthcare_db.staging TO ROLE job_ads_dlt_health_role;

-- check grants
SHOW GRANTS ON SCHEMA job_ads_healthcare_db.staging;
SHOW FUTURE GRANTS IN SCHEMA job_ads_healthcare_db.staging;

SHOW GRANTS TO ROLE job_ads_dlt_health_role;

SHOW GRANTS TO USER loader_extract;

GRANT ROLE job_ads_dlt_health_role TO USER Emmynaess;
GRANT ROLE job_ads_dlt_health_role TO USER Larissa_D;
GRANT ROLE job_ads_dlt_health_role TO USER Anton_B;


SHOW ROLES;


