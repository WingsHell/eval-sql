select s.firstname, s.lastname, ROUND(AVG(a.grade), 2) as moyenne, y.label
from assessment as a
join student as s 
on a.id_student = s.id
join enrolment as e 
on s.id = e.id_student
join year as y 
on e.id_year = y.id
where y.id = 2
group by s.id
order by e.from, moyenne, s.firstname, s.lastname;