--id : 28083148
-- Name : Jason Setiawan
DROP table CUSTBALANCE;

create table CUSTBALANCE
(
    cust_id NUMBER (2) not null primary key,
    cust_balance number (3) not null
);

INSERT INTO CUSTBALANCE(cust_balance, cust_id) VALUES(100, 1);
INSERT INTO CUSTBALANCE(cust_balance, cust_id) VALUES(200, 2);

commit;

--task 1
-- Connection 1 update the balance
-- of customer 1 from 100 to 110

UPDATE CUSTBALANCE
set cust_balance = 110
where cust_id = 1;

Select * from CUSTBALANCE;

commit;

-- task 4
UPDATE CUSTBALANCE
set cust_balance = 150
where cust_id = 2;

--task 5

UPDATE CUSTBALANCE
set cust_balance = 175
where cust_id = 2;