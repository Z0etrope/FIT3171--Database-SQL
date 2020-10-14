--connection 2
--id : 28083148
--name : jason setiawan

--task 3
--
select * from CUSTBALANCE;

--task 4
UPDATE CUSTBALANCE
set cust_balance = 100
where cust_id = 2;

--task 5
UPDATE CUSTBALANCE
set cust_balance = 125
where cust_id = 1;

--task 6
DROP table CUSTBALANCE;

create table CUSTBALANCE
(
    cust_id NUMBER (2) not null primary key,
    cust_balance number (3) not null
);

INSERT INTO CUSTBALANCE(cust_balance, cust_id) VALUES(100, 1);
INSERT INTO CUSTBALANCE(cust_balance, cust_id) VALUES(200, 2);

commit;