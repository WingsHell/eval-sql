select y.id as anneeEtude,ROUND(AVG(a.grade),2) as moyenne
from assessment as a
join enrolment as e
on a.id_student = e.id_student
join year as y
on e.id_year = y.id
join student as s
on s.id = a.id_student
group by y.id
order by moyenne DESC, lastname ASC; 