# REST_REVIEW
#기본키 : REVIEW_ID
# MEMBER_PROFILE
#기본키 : MEMBER_ID
# SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE,'%Y-%m-%d') AS REVIEW_DATE
# FROM(
# select count(rr.MEMBER_ID)
# from (SELECT rr.member_id, count(rr.MEMBER_ID) as cnt
#     from MEMBER_PROFILE mp join REST_REVIEW rr on mp.MEMBER_ID = rr.MEMBER_ID
#     group by rr.MEMBER_ID) tbl
#     ) TBL_2

# SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE,'%Y-%m-%d') AS REVIEW_DATE
# FROM MEMBER_PROFILE M JOIN (SELECT MEMBER_ID, REVIEW_TEXT, REVIEW_DATE, 
#                             COUNT(*) OVER(PARTITION BY MEMBER_ID) AS CNT
#                             FROM REST_REVIEW) R ON M.MEMBER_ID = R.MEMBER_ID
# WHERE CNT = (SELECT COUNT(*) CT
#              FROM REST_REVIEW
#              GROUP BY MEMBER_ID
#              ORDER BY COUNT(*) DESC LIMIT 1)
# ORDER BY REVIEW_DATE ASC, REVIEW_TEXT ASC;

# WITH TBL_1 AS (
# select count(MEMBER_ID)
# from (SELECT rr.member_id, count(rr.MEMBER_ID)
#     from MEMBER_PROFILE mp join REST_REVIEW rr on mp.MEMBER_ID = rr.MEMBER_ID
#     group by rr.MEMBER_ID
#     order by count(rr.MEMBER_ID) desc)
#     )
SELECT MP.MEMBER_NAME, R.REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, "%Y-%m-%d") AS REVIEW_DATE
FROM MEMBER_PROFILE AS MP
JOIN (
    SELECT RR.MEMBER_ID, REVIEW_TEXT, REVIEW_DATE
    FROM REST_REVIEW AS RR
    JOIN (
        SELECT MEMBER_ID
        FROM REST_REVIEW
        GROUP BY MEMBER_ID
        ORDER BY COUNT(REVIEW_ID) DESC
        LIMIT 1
    ) AS RRR
    ON RR.MEMBER_ID = RRR.MEMBER_ID
) AS R
ON MP.MEMBER_ID = R.MEMBER_ID
ORDER BY REVIEW_DATE, REVIEW_TEXT