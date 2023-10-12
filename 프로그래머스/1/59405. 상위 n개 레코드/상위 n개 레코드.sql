-- SELECT NAME
-- FROM (
-- SELECT NAME, RANK() OVER(ORDER BY DATETIME ASC) RANK
-- FROM ANIMAL_INS
--     )
-- WHERE RANK = 1
-- ;
SELECT NAME
FROM (
    SELECT NAME
    FROM ANIMAL_INS
    ORDER BY DATETIME
)
WHERE ROWNUM = 1
-- SELECT NAME
-- FROM ANIMAL_INS
-- ORDER BY DATETIME
-- FETCH FIRST 1 ROWS ONLY
-- ;