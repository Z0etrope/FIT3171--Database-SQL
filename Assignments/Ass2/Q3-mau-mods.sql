--****PLEASE ENTER YOUR DETAILS BELOW****
--Q3-mau-mods.sql
--Student ID:28083148
--Student Name:Jason Setiawan
--Tutorial No:

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
/*
3(ii) Changes to live database 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

CREATE TABLE exhibition(
    exhibition_id NUMBER(8),
    exhibition_name VARCHAR(50),
    exhibition_theme CHAR(1),
    exhibition_number_of_artworks NUMBER(3)
)

ALTER TABLE exhibition ADD CONSTRAINT exhibition_pk PRIMARY KEY ( exhibition_id );

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












