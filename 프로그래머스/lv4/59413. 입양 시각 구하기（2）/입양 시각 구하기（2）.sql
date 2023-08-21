-- 코드를 입력하세요
SELECT A.HOUR, NVL(B.CNT, 0) AS COUNT
FROM (
    SELECT ROWNUM - 1 AS HOUR
    FROM ANIMAL_OUTS
    WHERE ROWNUM - 1 <= 23
) A, (
    SELECT TO_CHAR(DATETIME, 'HH24') AS HOUR, COUNT(ANIMAL_ID) AS CNT
    FROM ANIMAL_OUTS
    GROUP BY TO_CHAR(DATETIME, 'HH24') 
) B
WHERE A.HOUR = B.HOUR(+)
ORDER BY A.HOUR
