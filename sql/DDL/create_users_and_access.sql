-- Active: 1717132926868@@127.0.0.1@5432@dw_dev@bronze
CREATE USER dataengineer_role WITH PASSWORD '';

GRANT ALL PRIVILEGES ON DATABASE dw_dev TO dataengineer_role;

CREATE USER dataanalyst_role WITH PASSWORD '';





