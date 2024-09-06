-- REPORTER ROLE
USE ROLE useradmin;
CREATE ROLE IF NOT EXISTS job_ads_reporter_health_role;

USE ROLE securityadmin;

GRANT USAGE ON WAREHOUSE care_wh TO ROLE job_ads_reporter_health_role;

GRANT USAGE ON DATABASE job_ads_healthcare_db TO ROLE job_ads_reporter_health_role;
GRANT USAGE ON SCHEMA job_ads_healthcare_db.marts TO ROLE job_ads_reporter_health_role;
GRANT SELECT ON ALL TABLES IN SCHEMA job_ads_healthcare_db.marts TO ROLE job_ads_reporter_health_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA job_ads_healthcare_db.marts TO ROLE job_ads_reporter_health_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA job_ads_healthcare_db.marts TO ROLE job_ads_reporter_health_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads_healthcare_db.marts TO ROLE job_ads_reporter_health_role;


GRANT ROLE job_ads_reporter_health_role TO USER reporter_health;
GRANT ROLE job_ads_reporter_health_role TO USER Emmynaess;
GRANT ROLE job_ads_reporter_health_role TO USER Larissa_D;
GRANT ROLE job_ads_reporter_health_role TO USER Anton_B;


