--****PLEASE ENTER YOUR DETAILS BELOW****
--Q3-mau-mods.sql
--Student ID:28083148
--Student Name:Jason Setiawan
--Tutorial No:Online-01

/* Comments for your marker:




*/


/*
3(i) Changes to live database 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE
ALTER TABLE customer
ADD customer_buy_count NUMBER(8);

COMMENT ON COLUMN customer.customer_buy_count
    IS 'Number of times customer has bought artworks';
    
UPDATE customer
SET customer_buy_count = 1
WHERE customer_id = 1;

UPDATE customer
SET customer_buy_count = 1
WHERE customer_id = 2;

UPDATE customer
SET customer_buy_count = 1
WHERE customer_id = 3;

UPDATE customer
SET customer_buy_count = 0
WHERE customer_id = 4;

UPDATE customer
SET customer_buy_count = 1
WHERE customer_id = 5;

UPDATE customer
SET customer_buy_count = 0
WHERE customer_id = 6;

UPDATE customer
SET customer_buy_count = 0
WHERE customer_id = 7;

UPDATE customer
SET customer_buy_count = 1
WHERE customer_id = 8;

UPDATE customer
SET customer_buy_count = 0
WHERE customer_id = 9;

UPDATE customer
SET customer_buy_count = 0
WHERE customer_id = 10;

commit;
/*
3(ii) Changes to live database 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

CREATE TABLE exhibition (
    exhibition_id                 NUMBER(8) NOT NULL,
    exhibition_name               VARCHAR(50) NOT NULL,
    exhibition_theme              CHAR(1) NOT NULL,
    exhibition_number_of_artworks NUMBER(3) NOT NULL
);

ALTER TABLE exhibition ADD CONSTRAINT exhibition_pk PRIMARY KEY ( exhibition_id );

ALTER TABLE exhibition ADD CONSTRAINT chk_exhibition_number_of_artworks CHECK (exhibition_number_of_artworks > 0);

ALTER TABLE exhibition
    ADD CONSTRAINT chk_exhibition_theme CHECK ( exhibition_theme IN ( 'A', 'M', 'O') );

COMMENT ON COLUMN exhibition.exhibition_id IS
    'identifier number for exhibition';

COMMENT ON COLUMN exhibition.exhibition_name IS
    'name of the exhibition';

COMMENT ON COLUMN exhibition.exhibition_number_of_artworks IS
    'total count of artwork(s) present in the exhibition';

COMMENT ON COLUMN exhibition.exhibition_theme IS
    'Exhibition Theme
    
A - Artist 
M - Media
O - Other

';

INSERT INTO exhibition VALUES(1, 'Jessi Alward Debut', 'A', 1);

ALTER TABLE aw_display
ADD exhibition_id NUMBER(8);

ALTER TABLE aw_display
    ADD CONSTRAINT aw_display_exhibition FOREIGN KEY ( exhibition_id )
        REFERENCES exhibition ( exhibition_id );
        
COMMENT ON COLUMN aw_display.exhibition_id IS
    'identifier number for exhibition';
        
UPDATE aw_display
SET exhibition_id = 1
WHERE artist_code = 3 AND artwork_no = 1 AND aw_display_start_date = TO_DATE('20-Dec-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM');

commit;






