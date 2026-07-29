{{ 
    config(
        materialized='table',
        tags=['processing', 'carmake']
    ) 
}}

SELECT
    DATE_TRUNC(MONTH,DDATE) AS DDATE,
    SALESPERSON,
    CARMAKE,
    SUM(SALEPRICE - COMNEA) AS TOTAL_SALE,
    SUM(COMNEA) AS TOTAL_COM
FROM {{ ref('stg_sales_data_2020p') }}
GROUP BY DATE_TRUNC(MONTH,DDATE), SALESPERSON, CARMAKE