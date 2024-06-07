CREATE TABLE gold (
    mes VARCHAR(20),
    numero_de_cajas INT,
    total_kg_harina DECIMAL(10, 2)
);

INSERT INTO gold (mes, numero_de_cajas, total_kg_harina)
WITH PRE AS (
    SELECT 
        count(*) as number_of_boxes,  
        EXTRACT(MONTH FROM fecha_sacrificio_esperada) as month, 
        tipo as type
    FROM silver.aggr_data
    GROUP BY 2, 3
),
PROD AS (
    SELECT 
        month,
        type,
        number_of_boxes,
        CASE 
            WHEN type = 'E' THEN number_of_boxes * 2.5
            WHEN type = 'R' THEN number_of_boxes * 1.5
        END as flour_produced_kg
    FROM PRE
)
SELECT
    TO_CHAR(TO_DATE(month::text, 'MM'), 'Month') as mes, 
    sum(number_of_boxes) as numero_de_cajas,
    sum(flour_produced_kg) as total_kg_harina
FROM PROD
GROUP BY 1;
