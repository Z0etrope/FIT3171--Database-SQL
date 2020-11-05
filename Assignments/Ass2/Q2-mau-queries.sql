--****PLEASE ENTER YOUR DETAILS BELOW****
--Q2-mau-queries.sql
--Student ID:
--Student Name:
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
    s.artist_code,
    b.artist_gname ||' '|| b.artist_fname AS artist_name,
    s.artwork_no,
    a.artwork_title,
    a.artwork_minpayment,
    (s.aws_date_time - a.artwork_submitdate) AS Number_of_Days_with_MAU
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
    artist_code asc,
    (s.aws_date_time - a.artwork_submitdate) desc;

/*
2(ii) Query 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
SELECT 
    d.artist_code,
    d.artwork_no,
    a.artwork_title,
    d.gallery_id,
    g.gallery_name,
    d.aw_display_start_date,
    (d.aw_display_end_date - d.aw_display_start_date)AS Number_of_days_in_gallery
FROM 
    aw_display d 
    JOIN gallery g ON d.gallery_id = g.gallery_id
    JOIN artwork a ON d.artist_code = a.artist_code
                   AND d.artwork_no = a.artwork_no
WHERE 
    d.aw_display_end_date IS NOT NULL
    AND (d.aw_display_end_date - d.aw_display_start_date)< 13
ORDER BY
    artist_code asc,
    artwork_no asc,
    (d.aw_display_end_date - d.aw_display_start_date) asc;



/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
SELECT artist_code, artwork_no, artwork_title, Number_of_Movement
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




/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

