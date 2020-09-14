-- STUDENT ID : 28083148
-- STUDENT NAME : JASON SETIAWAN
SET ECHO ON

SPOOL week7_schema_output.txt

DROP TABLE unit cascade constraints PURGE;

CREATE TABLE unit (
    unit_code   CHAR(7) NOT NULL,
    unit_name   VARCHAR(50) NOT NULL
) ;

ALTER TABLE unit ADD constraint unit_pk PRIMARY KEY (unit_code);

ALTER TABLE unit ADD constraint uq_unit_name UNIQUE (unit_name);

DROP TABLE student PURGE;


ALTER TABLE student ADD constraint student_pk PRIMARY KEY (stu_nbr);

ALTER TABLE student
add constraint stu_nbr_chk CHECK ( stu_nbr > 10000000 );

DROP TABLE enrolment PURGE;

CREATE TABLE enrolment (
    stu_nbr NUMBER(8) not null,
    unit_code CHAR(7) NOT NULL,
    enrol_year NUMBER(4) NOT NULL,
    enrol_semester CHAR(1) NOT NULL,
    enrol_mark NUMBER(3),
    enrol_grade CHAR(2)
);

ALTER TABLE enrolment
ADD CONSTRAINT enrolment_pk PRIMARY KEY
( stu_nbr, unit_code, enrol_year, enrol_semester );

ALTER TABLE enrolment
ADD CONSTRAINT enrolment_student_fk FOREIGN KEY
( stu_nbr ) REFERENCE student ( stu_nbr );

ALTER TABLE enrolment
ADD CONSTRAINT enrolment_unit_fk FOREIGN KEY
( unit_code ) REFERENCE unit ( unit_code );

ALTER TABLE enrolment
ADD CONSTRAINT enrol_semester_chk CHECK
( enroll_semester in( '1', '2', '3' ));
--

 SPOOL off
 
SET ECHO off