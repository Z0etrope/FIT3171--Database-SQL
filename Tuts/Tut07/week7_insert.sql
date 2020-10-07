spool week7_insert_output.txt
set echo on 
-- Name : Jason S
-- ID : 28083148

-- 7.3.1
-- ============================================================================
insert into student values (11111111,'Bloggs','Fred','01-Jan-1990');
insert into student values (11111112,'Nice','Nick','10-Oct-1994');
insert into student values (11111113,'Wheat','Wendy','05-May-1990');
insert into student values (11111114,'Sheen','Cindy','25-Dec-1996');
   
insert into unit values ('FIT5132','Introduction to Databases');
insert into unit values ('FIT5016','Project');
insert into unit values ('FIT5111','Student''s Life'); 
insert into unit values ('FIT9999','FIT Last Unit');

insert into enrolment values (11111111,'FIT5132',2013,'1',35,'N');
insert into enrolment values (11111111,'FIT5016',2013,'1',61,'C');
insert into enrolment values (11111111,'FIT5132',2013,'2',42,'N');
insert into enrolment values (11111111,'FIT5111',2013,'2',76,'D');
insert into enrolment values (11111111,'FIT5132',2014,'2',null,null);
insert into enrolment values (11111112,'FIT5132',2013,'2',83,'HD');
insert into enrolment values (11111112,'FIT5111',2013,'2',79,'D');
insert into enrolment values (11111113,'FIT5132',2014,'2',null,null);
insert into enrolment values (11111113,'FIT5111',2014,'2',null,null);
insert into enrolment values (11111114,'FIT5111',2014,'2',null,null); 

commit;

-- 7.3.2
-- ============================================================================
create sequence student_seq start with 11111115 increment by 1;

select * from cat;

insert into student values (student_seq.nextval, 'Mouse', 'Mickey', '01-Feb-1980');

select * from student;


insert into enrolment values (student_seq.currval, 'FIT5132', 2016, '2', null, null);

commit;

select * from enrolment;

-- 7.3.3
-- ============================================================================

insert into student values (student_seq.nextval, 'Last', 'First', '01-Jan-1999');

insert into enrolment values (student_seq.currval, 
  (select unit_code from unit where unit_name = 'Introduction to Databases'),
   2016, '2', null, null);

commit;

select * from student;
select * from enrolment;

create table FIT5111_STUDENT
 as select *
 from enrolment
 where unit_code = 'FIT5111';
 
select * from fit5111_student; 

-- 7.3.4
-- ======================================================================

alter table unit
  add (credit_points number(2,0) default 6);
  
insert into unit values ('FIT1234', 'Unit FIT1234', 12);

commit;

select * from unit;

set echo off
spool off
