-- 코드를 입력하세요
SELECT
    EXTRACT(YEAR FROM SALES_DATE) YEAR,
    EXTRACT(MONTH FROM SALES_DATE) MONTH,
    COUNT(DISTINCT USER_ID) AS PURCHASED_USERS,
    ROUND(COUNT(DISTINCT USER_ID) / (SELECT COUNT(USER_ID)
                                    FROM USER_INFO
                                    WHERE EXTRACT(YEAR FROM JOINED) = 2021), 1) AS PURCHASED_RATIO
FROM (
    SELECT U.USER_ID, O.SALES_DATE
    FROM USER_INFO U, ONLINE_SALE O
    WHERE U.USER_ID = O.USER_ID
    AND EXTRACT(YEAR FROM JOINED) = 2021
)
GROUP BY
    EXTRACT(YEAR FROM SALES_DATE),
    EXTRACT(MONTH FROM SALES_DATE)
ORDER BY
    YEAR,
    MONTH