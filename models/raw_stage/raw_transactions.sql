SELECT
    b.O_ORDERKEY AS ORDER_ID,
    b.O_CUSTKEY AS CUSTOMER_ID,
    b.O_ORDERDATE AS ORDER_DATE,
    -- DATEADD(DAY, 20, b.O_ORDERDATE) AS TRANSACTION_DATE,
    b.O_ORDERDATE + INTERVAL '20 day'  AS TRANSACTION_DATE,
    cast(RPAD(CONCAT(b.O_ORDERKEY, b.O_CUSTKEY, TO_CHAR(b.O_ORDERDATE, 'YYYYMMDD')),  24, '0') as numeric) AS TRANSACTION_NUMBER,
    b.O_TOTALPRICE AS AMOUNT,
    CASE 
    ROUND(MOD(CAST(RANDOM() as NUMERIC)+1,2),0)
        WHEN 1 THEN 'DR'
        WHEN 2 THEN 'CR'
        END
    AS TYPE 
FROM {{ source('tpch_sample', 'orders') }}  AS b
LEFT JOIN {{ source('tpch_sample', 'customer') }} AS c
    ON b.O_CUSTKEY = c.C_CUSTKEY
WHERE b.O_ORDERDATE = TO_DATE('{{ var('load_date') }}', 'YYYY-MM-DD')