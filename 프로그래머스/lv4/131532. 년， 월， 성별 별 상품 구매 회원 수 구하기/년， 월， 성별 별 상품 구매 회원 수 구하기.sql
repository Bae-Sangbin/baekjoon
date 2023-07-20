-- 코드를 입력하세요
SELECT
    EXTRACT(YEAR FROM SALES_DATE) AS YEAR,
    EXTRACT(MONTH FROM SALES_DATE) AS MONTH,
    GENDER,
    COUNT(DISTINCT O.USER_ID) AS USERS
FROM USER_INFO I, ONLINE_SALE O
WHERE I.USER_ID = O.USER_ID
AND GENDER IS NOT NULL
GROUP BY 
    EXTRACT(YEAR FROM SALES_DATE),
    EXTRACT(MONTH FROM SALES_DATE),
    GENDER
ORDER BY
    YEAR, MONTH, GENDER