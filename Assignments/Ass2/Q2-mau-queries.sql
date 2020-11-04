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




/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE





/*
2(iv) Query 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE





/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE




