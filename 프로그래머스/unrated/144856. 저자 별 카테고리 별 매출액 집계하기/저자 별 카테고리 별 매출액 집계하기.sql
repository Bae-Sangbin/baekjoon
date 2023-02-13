SELECT A.AUTHOR_ID, AUTHOR_NAME, CATEGORY, SUM(SALES*PRICE) AS TOTAL_SALES
FROM BOOK A JOIN AUTHOR B ON A.AUTHOR_ID = B.AUTHOR_ID
JOIN BOOK_SALES C ON A.BOOK_ID = C.BOOK_ID
WHERE DATE_FORMAT(SALES_DATE,'%Y-%m') = '2022-01' 
GROUP BY A.AUTHOR_ID, CATEGORY
ORDER BY A.AUTHOR_ID ASC, CATEGORY DESC;