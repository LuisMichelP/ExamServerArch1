CREATE TABLE silver.aggr_data AS
SELECT 
  id,
  counter,
  fecha_registro,
  fecha_nacimiento,
  tipo,
  volumen,
  CASE
    WHEN tipo = 'R' THEN fecha_nacimiento + INTERVAL '42 days'
    WHEN tipo = 'E' THEN fecha_nacimiento + INTERVAL '45 days'
  END as fecha_reproduccion_esperada,
  CASE
    WHEN tipo = 'R' THEN fecha_nacimiento + INTERVAL '54 days'
    WHEN tipo = 'E' THEN fecha_nacimiento + INTERVAL '35 days'
  END as fecha_sacrificio_esperada
FROM 
    bronze.raw_data;


select * from silver.aggr_data limit 5;