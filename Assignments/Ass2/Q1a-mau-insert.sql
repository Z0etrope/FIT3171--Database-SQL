--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1a-mau-insert.sql
--Student ID: 28083148
--Student Name: Jason Setiawan
--Tutorial No: Online-01

/* Comments for your marker:




*/


/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

--artwork insert
INSERT INTO artwork VALUES(1, 1, 'Lisamona', 1000000, TO_DATE('14-Nov-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(2, 1, 'Nekid Grandma', 2000000, TO_DATE('15-Mar-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(1, 2, 'Not Thinker', 1500000, TO_DATE('03-Jun-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(3, 1, 'What?', 1750000, TO_DATE('29-Oct-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(1, 3, 'Hard Assignment', 2250000, TO_DATE('19-Nov-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(4, 1, 'Send Help!', 3000000, TO_DATE('17-Sep-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(2, 2, 'John Monash', 2500000, TO_DATE('01-Apr-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(5, 1, 'What', 1700000, TO_DATE('01-Jul-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(6, 1, 'Black line', 1900000, TO_DATE('11-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(7, 1, 'Red Dot', 2300000, TO_DATE('23-May-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(8, 1, 'First Supper', 3400000, TO_DATE('25-Dec-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(9, 1, 'Pilasso', 7900000, TO_DATE('05-Jul-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(10, 1, 'Di Caprico', 4800000, TO_DATE('15-Jun-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(11, 1, 'Why?', 5000000, TO_DATE('15-Sep-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));
INSERT INTO artwork VALUES(12, 1, 'How?', 3600000, TO_DATE('27-Feb-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'));

--artwork display insert

INSERT INTO aw_display VALUES(1, 1, 3, TO_DATE('01-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), TO_DATE('15-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 1);
INSERT INTO aw_display VALUES(2, 2, 1, TO_DATE('02-Apr-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), TO_DATE('28-Apr-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 2);
INSERT INTO aw_display VALUES(3, 3, 1, TO_DATE('20-Dec-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), TO_DATE('05-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 3);
INSERT INTO aw_display VALUES(4, 4, 1, TO_DATE('01-Oct-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), TO_DATE('20-Oct-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 4);
INSERT INTO aw_display VALUES(5, 5, 1, TO_DATE('13-Aug-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), TO_DATE('20-Aug-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 5);
INSERT INTO aw_display VALUES(6, 1, 2, TO_DATE('03-Jul-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), TO_DATE('14-Jul-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 1);
INSERT INTO aw_display VALUES(7, 2, 2, TO_DATE('10-Apr-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), TO_DATE('15-Apr-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 2);
INSERT INTO aw_display VALUES(8, 11, 1, TO_DATE('17-Sep-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), TO_DATE('29-Sep-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 3);
INSERT INTO aw_display VALUES(9, 8, 1, TO_DATE('31-Dec-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), TO_DATE('14-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 4);
INSERT INTO aw_display VALUES(10, 12, 1, TO_DATE('01-Mar-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), TO_DATE('09-Mar-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 5);

--sale insert

INSERT INTO sale VALUES(1, TO_DATE('15-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 2900000, 2, 1);
INSERT INTO sale VALUES(2, TO_DATE('20-Oct-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 4000000, 3, 4);
INSERT INTO sale VALUES(3, TO_DATE('20-Aug-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 2250000, 5, 5);
INSERT INTO sale VALUES(4, TO_DATE('15-Apr-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 3300000, 8, 7);

--aw_status 

INSERT INTO aw_status VALUES(1, 1, 1, TO_DATE('14-Nov-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(2, 2, 1, TO_DATE('15-Mar-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(3, 1, 2, TO_DATE('03-Jun-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(4, 3, 1, TO_DATE('29-Oct-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(5, 1, 3, TO_DATE('19-Nov-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(6, 4, 1, TO_DATE('17-Sep-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(7, 2, 2, TO_DATE('01-Apr-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(8, 5, 1, TO_DATE('01-Jul-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(9, 6, 1, TO_DATE('11-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(10, 7, 1, TO_DATE('23-May-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(11, 8, 1, TO_DATE('25-Dec-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(12, 9, 1, TO_DATE('05-Jul-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(13, 10, 1, TO_DATE('15-Jun-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(14, 11, 1, TO_DATE('15-Sep-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(15, 12, 1, TO_DATE('27-Feb-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);

INSERT INTO aw_status VALUES(16, 1, 3, TO_DATE('01-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 1);
INSERT INTO aw_status VALUES(17, 2, 1, TO_DATE('02-Apr-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 2);
INSERT INTO aw_status VALUES(18, 3, 1, TO_DATE('20-Dec-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 3);
INSERT INTO aw_status VALUES(19, 4, 1, TO_DATE('01-Oct-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 4);
INSERT INTO aw_status VALUES(20, 5, 1, TO_DATE('13-Aug-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 5);
INSERT INTO aw_status VALUES(21, 1, 2, TO_DATE('03-Jul-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 1);
INSERT INTO aw_status VALUES(22, 2, 2, TO_DATE('10-Apr-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 2);
INSERT INTO aw_status VALUES(23, 11, 1, TO_DATE('17-Sep-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 3);
INSERT INTO aw_status VALUES(24, 8, 1, TO_DATE('31-Dec-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 4);
INSERT INTO aw_status VALUES(25, 12, 1, TO_DATE('01-Mar-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 5);

INSERT INTO aw_status VALUES(26, 1, 3, TO_DATE('01-Jan-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'G', 1);
INSERT INTO aw_status VALUES(27, 2, 1, TO_DATE('02-Apr-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'G', 2);
INSERT INTO aw_status VALUES(28, 3, 1, TO_DATE('20-Dec-2019 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'G', 3);
INSERT INTO aw_status VALUES(29, 4, 1, TO_DATE('01-Oct-2019 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'G', 4);
INSERT INTO aw_status VALUES(30, 5, 1, TO_DATE('13-Aug-2019 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'G', 5);
INSERT INTO aw_status VALUES(31, 1, 2, TO_DATE('03-Jul-2019 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'G', 1);
INSERT INTO aw_status VALUES(32, 2, 2, TO_DATE('10-Apr-2019 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'G', 2);
INSERT INTO aw_status VALUES(33, 11, 1, TO_DATE('17-Sep-2019 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'G', 3);
INSERT INTO aw_status VALUES(34, 8, 1, TO_DATE('31-Dec-2019 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'G', 4);
INSERT INTO aw_status VALUES(35, 12, 1, TO_DATE('01-Mar-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'G', 5);

INSERT INTO aw_status VALUES(36, 1, 3, TO_DATE('15-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'S', 1);
INSERT INTO aw_status VALUES(37, 2, 1, TO_DATE('28-Apr-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 2);
INSERT INTO aw_status VALUES(38, 3, 1, TO_DATE('05-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 3);
INSERT INTO aw_status VALUES(39, 4, 1, TO_DATE('20-Oct-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'S', 4);
INSERT INTO aw_status VALUES(40, 5, 1, TO_DATE('20-Aug-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'S', 5);
INSERT INTO aw_status VALUES(41, 1, 2, TO_DATE('14-Jul-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 1);
INSERT INTO aw_status VALUES(42, 2, 2, TO_DATE('15-Apr-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'S', 2);
INSERT INTO aw_status VALUES(43, 11, 1, TO_DATE('29-Sep-2019 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 3);
INSERT INTO aw_status VALUES(44, 8, 1, TO_DATE('14-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 4);
INSERT INTO aw_status VALUES(45, 12, 1, TO_DATE('09-Mar-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'T', 5);

INSERT INTO aw_status VALUES(46, 2, 1, TO_DATE('28-Apr-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(47, 3, 1, TO_DATE('05-Jan-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(48, 1, 2, TO_DATE('14-Jul-2019 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(49, 11, 1, TO_DATE('29-Sep-2019 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(50, 8, 1, TO_DATE('14-Jan-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);
INSERT INTO aw_status VALUES(51, 12, 1, TO_DATE('09-Mar-2020 11:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'W', NULL);

INSERT INTO aw_status VALUES(52, 1, 2, TO_DATE('03-Mar-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'R', NULL);
INSERT INTO aw_status VALUES(53, 11, 1, TO_DATE('11-Jun-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'R', NULL);
INSERT INTO aw_status VALUES(54, 1, 1, TO_DATE('06-Jan-2020 10:00:00 AM','dd-mon-yyyy hh:mi:ss AM'), 'R', NULL);




