SELECT
	*
FROM
	uni.student
WHERE
	studlname LIKE 'S%'
ORDER BY
	studfname;

3.

SELECT
	unitcode,
	semester
FROM
	uni.offering
WHERE
	to_char(ofyear, 'yyyy') = '2019'
ORDER BY
	unitcode;
	semester;

4.
SELECT *
FROM uni.student s join uni.enrolment e
ON s.studid = e.studid
where e.mark between 80 and 100
and e.semester = 2
and to_char(e.ofyear, 'yyyy') = '2019'
and e.unitcode = 'FIT9132'
order by full_name;

5.
select studfname || ' ' || studlname as full_name, unitname

FROM uni.student s join uni.enrolment e
ON s.studid = e.studid

where e.semester = 1 and to_char(ofyear, 'yyyy') = '2020'

order by unitname, e.studid desc;

6.
select u.unitcode, u.unitname, p.has_prereq_of, u2.unitname

from uni.unit u join uni.prereq p on u.unitcode = p.unitcode;

join uni.unit u2 on u2.unitcode = p.has_prereq_of

order by u.unitcode, p.has_prereq_of
