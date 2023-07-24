SELECT
    TO_CHAR(SALES_DATE, 'YYYY-MM-DD') AS SALES_DATE,
    PRODUCT_ID,
    USER_ID,
    SALES_AMOUNT
FROM 
    (
        SELECT
            SALES_DATE,
            PRODUCT_ID,
            USER_ID,
            SALES_AMOUNT
        FROM ONLINE_SALE
        UNION
        SELECT
            SALES_DATE,
            PRODUCT_ID,
            NULL USER_ID,
            SALES_AMOUNT
        FROM OFFLINE_SALE
    )
WHERE TO_CHAR(SALES_DATE, 'YYYY-MM') = '2022-03'
ORDER BY
    SALES_DATE,
    PRODUCT_ID,
    USER_ID