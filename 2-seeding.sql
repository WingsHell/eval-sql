use gestion_etudiant;

INSERT INTO year (label) values ("First year (Bsc)");
INSERT INTO year (label) values ("Second year (Bsc Hons)");
INSERT INTO year (label) values ("Third year (Msc)");

INSERT INTO student (firstname,lastname) values ("Olivier","Martin");
INSERT INTO student (firstname,lastname) values ("Pierre","Martin");
INSERT INTO student (firstname,lastname) values ("Jacques","Martin");
INSERT INTO student (firstname,lastname) values ("Martin","François");
INSERT INTO student (firstname,lastname) values ("Jenniver","Garner");

INSERT INTO module (name,year) values ("linux",1);
INSERT INTO module (name,year) values ("docker",1);
INSERT INTO module (name,year) values ("symfony",2);
INSERT INTO module (name,year) values ("asp.net core",2);
INSERT INTO module (name,year) values ("aspect oriented architecture",3);
INSERT INTO module (name,year) values ("ddd and hexagonal architecture",3);

INSERT INTO enrolment (id_student,id_year,`from`,`to`) values (1,1,"2015-01-01 00:00:00","2015-12-31 00:00:00");
INSERT INTO enrolment (id_student,id_year,`from`,`to`) values (1,2,"2016-01-01 00:00:00","2016-12-31 00:00:00");
INSERT INTO enrolment (id_student,id_year,`from`,`to`) values (1,3,"2017-01-01 00:00:00","2017-12-31 00:00:00");
INSERT INTO enrolment (id_student,id_year,`from`,`to`) values (2,1,"2015-01-01 00:00:00","2015-12-31 00:00:00");
INSERT INTO enrolment (id_student,id_year,`from`,`to`) values (2,2,"2016-01-01 00:00:00","2016-12-31 00:00:00");
INSERT INTO enrolment (id_student,id_year,`from`,`to`) values (2,3,"2017-01-01 00:00:00","2017-12-31 00:00:00");
INSERT INTO enrolment (id_student,id_year,`from`,`to`) values (3,2,"2017-01-01 00:00:00","2017-12-31 00:00:00");

INSERT INTO assessment (id_student,id_module,attempted,passed,grade) values (1,2,"2015-12-31 00:00:00","2016-01-30 00:00:00",1);
INSERT INTO assessment (id_student,id_module,attempted,passed,grade) values (2,3,"2014-06-30 00:00:00","2015-10-25 00:00:00",1);
INSERT INTO assessment (id_student,id_module,attempted,passed,grade) values (3,1,"2013-08-15 00:00:00","2013-11-20 00:00:00",1);
INSERT INTO assessment (id_student,id_module,attempted,passed,grade) values (4,2,"2017-11-05 00:00:00","2017-12-05 00:00:00",1);
INSERT INTO assessment (id_student,id_module,attempted,passed,grade) values (5,3,"2017-09-25 00:00:00","2018-02-16 00:00:00",1);
