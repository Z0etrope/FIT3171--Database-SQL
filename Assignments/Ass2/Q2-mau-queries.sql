--****PLEASE ENTER YOUR DETAILS BELOW****
--Q2-mau-queries.sql
--Student ID:28083148
--Student Name:Jason Setiawan
--Tutorial No:

/* Comments for your marker:
even if the artwork is bought before the date the display is over, it will still be displayed on the gallery. it will then be delivered to the owner after the display date is over.
(i)


(ii)
aw_display that has ended/completed will have a date value instead of null value

(iii)
artwork that has 0 Movement i.e. necer been displayed on a gallery is not shown

*/

/*
2(i) Query 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
SELECT 
    s.artist_code AS "Artist Code",
    b.artist_gname ||' '|| b.artist_fname AS "Artist Name",
    s.artwork_no AS "Artwork No",
    a.artwork_title AS "Artwork Title",
    a.artwork_minpayment AS "Artwork Min. Payment",
    (s.aws_date_time - a.artwork_submitdate) AS "Number of Days with MAU"
from aw_status s
    JOIN artwork a ON s.artist_code = a.artist_code
                  AND s.artwork_no = a.artwork_no
    JOIN artist b ON s.artist_code = b.artist_code
WHERE NOT EXISTS (SELECT *
                  FROM aw_display d
                  WHERE s.artist_code = d.artist_code AND
                        s.artwork_no = d.artwork_no)
     AND aws_action = 'R'
     AND (s.aws_date_time - a.artwork_submitdate) < 120
ORDER BY
    s.artist_code asc,
    (s.aws_date_time - a.artwork_submitdate) desc;

/*
2(ii) Query 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
SELECT 
    d.artist_code AS "Artist Code",
    d.artwork_no AS "Artwork No",
    a.artwork_title AS "Artwork Title",
    d.gallery_id AS "Gallery ID",
    g.gallery_name AS "Gallery Name",
    d.aw_display_start_date AS "Display Start Date",
    (d.aw_display_end_date - d.aw_display_start_date)AS "Number of days in gallery"
FROM 
    aw_display d 
    JOIN gallery g ON d.gallery_id = g.gallery_id
    JOIN artwork a ON d.artist_code = a.artist_code
                   AND d.artwork_no = a.artwork_no
WHERE 
    d.aw_display_end_date IS NOT NULL
    AND (d.aw_display_end_date - d.aw_display_start_date)< 13
ORDER BY
    d.artist_code asc,
    d.artwork_no asc,
    (d.aw_display_end_date - d.aw_display_start_date) asc;



/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
SELECT artist_code AS "ARTIST_CODE", artwork_no AS "ARTWORK_NO", artwork_title AS "Artwork Title", Number_of_Movement AS "Number of Movement"
FROM
(
SELECT
    s.artist_code,
    s.artwork_no,
    a.artwork_title,
    COUNT(*) as Number_of_Movement,
    avg(count(*))over() as averages
FROM 
    aw_status s 
    JOIN artwork a ON s.artist_code = a.artist_code
                   AND s.artwork_no = a.artwork_no
WHERE
    s.aws_action = 'T'
GROUP BY 
    s.artist_code, s.artwork_no, a.artwork_title
)
WHERE Number_of_Movement < averages;

    

    



/*
2(iv) Query 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
SELECT DISTINCT
    a.artist_code AS "Artist Code",
    a.artwork_title AS "Artwork Title",
    ROUND((a.artwork_minpayment + (a.artwork_minpayment*(SELECT gallery_sale_percent FROM gallery WHERE gallery_id='1')/100)) +(a.artwork_minpayment/5)) AS "Min. Sale Price Est.(Gallery 1)",
    ROUND((a.artwork_minpayment + (a.artwork_minpayment*(SELECT gallery_sale_percent FROM gallery WHERE gallery_id='2')/100)) +(a.artwork_minpayment/5)) AS "Min. Sale Price Est.(Gallery 2)",
    ROUND((a.artwork_minpayment + (a.artwork_minpayment*(SELECT gallery_sale_percent FROM gallery WHERE gallery_id='3')/100)) +(a.artwork_minpayment/5)) AS "Min. Sale Price Est.(Gallery 3)",
    ROUND((a.artwork_minpayment + (a.artwork_minpayment*(SELECT gallery_sale_percent FROM gallery WHERE gallery_id='4')/100)) +(a.artwork_minpayment/5)) AS "Min. Sale Price Est.(Gallery 4)",
    ROUND((a.artwork_minpayment + (a.artwork_minpayment*(SELECT gallery_sale_percent FROM gallery WHERE gallery_id='5')/100)) +(a.artwork_minpayment/5)) AS "Min. Sale Price Est.(Gallery 5)"
FROM 
    artwork a
    JOIN aw_status s ON a.artist_code = s.artist_code
                        AND a.artwork_no = s.artwork_no
WHERE NOT EXISTS (SELECT *
                  FROM sale s JOIN aw_display d ON s.aw_display_id = d.aw_display_id
                  WHERE a.artist_code = d.artist_code AND
                        a.artwork_no = d.artwork_no)
ORDER BY
    a.artist_code asc,
    a.artwork_title asc;



/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    TO_CHAR(d.artist_code) AS "Artist Code",
    t.artist_gname ||' '|| t.artist_fname AS "Artist Full Name",
    a.artwork_title AS "Artwork Title",
    TO_CHAR(d.gallery_id) AS "Gallery ID",
    TO_CHAR(s.sale_price) AS "Sale Price",
    TO_CHAR(ROUND(((s.sale_price - (a.artwork_minpayment + (a.artwork_minpayment * g.gallery_sale_percent/100) + (a.artwork_minpayment/5)))/(a.artwork_minpayment + (a.artwork_minpayment * g.gallery_sale_percent/100) + (a.artwork_minpayment/5))*100),1))||''||'%' AS "% Sold Above Min. Sell Price"
FROM
    sale s
    JOIN aw_display d ON s.aw_display_id = d.aw_display_id
    JOIN artwork a ON d.artist_code = a.artist_code
                    AND d.artwork_no = a.artwork_no
    JOIN gallery g ON d.gallery_id = g.gallery_id
    JOIN artist t ON a.artist_code = t.artist_code
    
UNION ALL

SELECT '-----','---------','--------','--------','AVERAGE = ', TO_CHAR(AVG(minpay))||''||'%' as test4
FROM
(
SELECT
    ROUND(((s.sale_price - (a.artwork_minpayment + (a.artwork_minpayment * g.gallery_sale_percent/100) + (a.artwork_minpayment/5)))/(a.artwork_minpayment + (a.artwork_minpayment * g.gallery_sale_percent/100) + (a.artwork_minpayment/5))*100),1) AS minpay
FROM
    sale s
    JOIN aw_display d ON s.aw_display_id = d.aw_display_id
    JOIN artwork a ON d.artist_code = a.artist_code
                    AND d.artwork_no = a.artwork_no
    JOIN gallery g ON d.gallery_id = g.gallery_id
    JOIN artist t ON a.artist_code = t.artist_code
)
