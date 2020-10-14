SPOOL week8_sqlbasic_part_b_output.txt
/* 1.List all the unit codes, semesters and names of chief examiners for all the units that are
offered in 2020. Order the output by semester then by unit code.
*/

SELECT
    o.unitcode,
    semester,
    stafffname,
    stafflname
FROM
    uni.offering o
    JOIN uni.staff s ON o.chiefexam = s.staffid
WHERE
    TO_CHAR(ofyear,'yyyy') = '2020'
ORDER BY
    o.unitcode,
    semester;


/*2. List all unit codes, unit names and their year and semester of offering. Order the output by
unit code then by offering year and then semester. To display the offering year correctly in
Oracle, you need to use the to_char function. For example, to_char(ofyear,'yyyy').*/

SELECT
    u.unitcode,
    unitname,
    TO_CHAR(ofyear,'YYYY') AS offeringyr,
    semester
FROM
    uni.unit u
    JOIN uni.offering o ON u.unitcode = o.unitcode
ORDER BY
    unitcode,
    offeringyr,
    semester;

/*3.List the unit code, semester, class type (lecture or tutorial), day and time for all units taught
by Windham Ellard in 2020. Sort the list according to the unit code.
*/

SELECT
    unitcode,
    semester,
    cltype,
    clday,
    TO_CHAR(cltime,'HHAM') AS time
FROM
    uni.staff s
    JOIN uni.schedclass sc ON s.staffid = sc.staffid
WHERE
    stafffname = 'Windham'
    AND stafflname = 'Ellard'
    AND TO_CHAR(ofyear,'yyyy') = '2020'
ORDER BY
    unitcode,
    semester,
    cltype,
    clday,
    cltime;


/*4.Create a study statement for Friedrick Geist. A study statement contains unit code, unit
name, semester and year the study was attempted, the mark and grade. If the mark and
grade is unknown, show the mark and grade as ‘N/A’. Sort the list by year, then by semester
and unit code*/

SELECT
    e.unitcode,
    unitname,
    semester,
    TO_CHAR(ofyear,'yyyy') AS "YEAR OF ENROLMENT",
    mark,
    grade
FROM
    uni.student s
    JOIN uni.enrolment e ON s.studid = e.studid
    JOIN uni.unit u ON e.unitcode = u.unitcode
WHERE
    studfname = 'Friedrick'
    AND studlname = 'Geist'
ORDER BY
    "YEAR OF ENROLMENT",
    semester,
    unitcode;


/*5. .List the unit code and unit name of the prerequisite units of the 'Introduction to data science'
unit. Order the output by prerequisite unit code*/

SELECT
    has_prereq_of   AS prereqUnitcode,
    u2.unitname     AS prereqUnitname
FROM
    uni.unit u1
    JOIN uni.prereq p ON u1.unitcode = p.unitcode
    JOIN uni.unit u2 ON u2.unitcode = p.has_prereq_of
WHERE
    u1.unitname = 'Introduction to data science'
ORDER BY
    prereqUnitcode;


/*6.Find all students (list their id, firstname and surname) who have received an HD for FIT2094
in semester 2 of 2019. Sort the list by student id.*/

SELECT DISTINCT
    s.studid,
    studlname,
    studfname
FROM
    uni.student s
    JOIN uni.enrolment e ON s.studid = e.studid
WHERE
    mark > 80
    AND TO_CHAR(ofyear,'yyyy') = '2019'
    AND semester = 2
ORDER BY
    s.studid;

/*7.List the student full name, unit code for those students who have no mark in any unit in
semester 1 of 2020. Sort the list by student full name.*/

SELECT
    s.studid,
    studfname,
    studlname,
    TO_CHAR(ofyear,'yyyy') AS "YEAR OF ENROLMENT",
    semester,
    e.unitcode
FROM
    uni.student s
    JOIN uni.enrolment e ON s.studid = e.studid
WHERE
    mark IS NULL
    AND TO_CHAR(ofyear,'yyyy') = '2020'
    AND semester = 1;