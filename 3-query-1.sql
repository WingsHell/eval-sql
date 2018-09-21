select s.firstname,s.lastname,y.label
from student as s
join enrolment e
on s.id = e.id_student
right join year as y
on e.id_year = y.id
where e.`from` <= "2017-01-07 00:00:00"
order by lastname ASC;