select AVG(a.grade)
from assessment as a
join student as s
on a.id_student=s.id;