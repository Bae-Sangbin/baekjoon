-- 코드를 입력하세요
WITH BEST AS (SELECT M.MEMBER_ID, M.MEMBER_NAME, COUNT(R.REVIEW_ID) REVIEW_C
FROM REST_REVIEW R
JOIN MEMBER_PROFILE M ON R.MEMBER_ID = M.MEMBER_ID
GROUP BY M.MEMBER_ID
ORDER BY REVIEW_C DESC
LIMIT 1)

SELECT M.MEMBER_NAME, R.REVIEW_TEXT, 
        DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM REST_REVIEW R
JOIN MEMBER_PROFILE M ON R.MEMBER_ID = M.MEMBER_ID
WHERE R.MEMBER_ID IN (SELECT MEMBER_ID
                    FROM BEST)
ORDER BY REVIEW_DATE, REVIEW_TEXT