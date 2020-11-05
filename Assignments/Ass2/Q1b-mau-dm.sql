--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1b-mau-dm.sql
--Student ID:28083148
--Student Name:Jason Setiawan
--Tutorial No:

/* Comments for your marker:




*/


/*
1b(i) Create a sequence 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
CREATE SEQUENCE awstatus_seq START WITH 300 INCREMENT BY 1;

CREATE SEQUENCE awdisplay_seq START WITH 300 INCREMENT BY 1;

CREATE SEQUENCE sale_seq START WITH 300 INCREMENT BY 1;


/*
1b(ii) Take the necessary steps in the database to record data.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
INSERT INTO artwork VALUES(17, 1, 'Catherine of Siena', 500000, TO_DATE('22-Oct-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO aw_status VALUES(awstatus_seq.NEXTVAL, 17, 1, TO_DATE('22-Oct-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);





/*
1b(iii) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
-- (a)
INSERT INTO aw_status VALUES(awstatus_seq.NEXTVAL, 17, 1, TO_DATE('22-Oct-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', (SELECT DISTINCT gallery_id FROM gallery WHERE gallery_phone = 0413432569));


-- (b)
INSERT INTO aw_status VALUES(awstatus_seq.NEXTVAL, 17, 1, TO_DATE('22-Oct-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM')+195/1440, 'G', (SELECT DISTINCT gallery_id FROM gallery WHERE gallery_phone = 0413432569));



-- (c)
INSERT INTO aw_display VALUES(awdisplay_seq.NEXTVAL, 17, 1, TO_DATE('22-Oct-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM')+1, TO_DATE('22-Oct-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM')+10, (SELECT DISTINCT gallery_id FROM gallery WHERE gallery_phone = 0413432569));



/*
1b(iv) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
INSERT INTO sale VALUES(sale_seq.NEXTVAL, TO_DATE('22-Oct-2020 02:30:00 PM','dd-mon-yyyy hh:mi:ss PM')+1+5, 850000, 1, (SELECT aw_display_id FROM aw_display WHERE artist_code = 17 AND artwork_no = 1));
INSERT INTO aw_status VALUES(awstatus_seq.NEXTVAL, 17, 1, TO_DATE('22-Oct-2020 02:30:00 PM','dd-mon-yyyy hh:mi:ss PM')+5+1, 'S', NULL);


