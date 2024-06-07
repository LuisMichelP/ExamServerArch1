CREATE TABLE bronze.raw_data (
    id VARCHAR PRIMARY KEY,
    counter INTEGER,
    fecha_registro DATE,
    fecha_nacimiento DATE,
    tipo CHAR(1),
    volumen FLOAT
);

COPY bronze.raw_data FROM '/home/import/bquxjob_125b8a83_18fd1114a9f.csv' DELIMITER ',' CSV HEADER;


select * from bronze.raw_data limit 5;

