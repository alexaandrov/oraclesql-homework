CREATE TABLE grades (
  grade_id      NUMBER(7),
  study_year    DATE,
  semestr       NUMBER(1),
  grade         NUMBER(1),
  student_id    NUMBER(7) NOT NULL,
  discipline_id NUMBER(7) NOT NULL,
  CONSTRAINT grade_id_pk PRIMARY KEY (grade_id),
  CONSTRAINT grade_stud_fk FOREIGN KEY (student_id)
  REFERENCES students (student_id) ON DELETE CASCADE,
  CONSTRAINT grade_dis_fk FOREIGN KEY (discipline_id)
  REFERENCES discipline (discipline_id) ON DELETE CASCADE
);

CREATE TABLE coefficients (
  coef_id     NUMBER(7),
  study_year  DATE NOT NULL,
  semestr     NUMBER(1),
  coef_lower  NUMBER(1, 2),
  coef_middle NUMBER(1, 2),
  coef_upper  NUMBER(1, 2),
  min_salary  NUMBER(8, 2),
  CONSTRAINT coef_id_pk PRIMARY KEY (coef_id)
);

CREATE SEQUENCE student_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE grade_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE discipline_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE coefficient_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SYNONYM st
FOR students;

CREATE SYNONYM gr
FOR grades;

CREATE SYNONYM dis
FOR discipline;

CREATE SYNONYM cof
FOR coefficients;

-- КОНЕЦ СОЗДАНИЯ БАЗЫ ДАННЫХ

DROP TABLE discipline;
DROP TABLE grades;
DROP TABLE students;
DROP TABLE coefficients;

DESCRIBE coefficients;
DESCRIBE discipline;
DESCRIBE students;
DESCRIBE grades;

SELECT *
FROM students;
SELECT *
FROM grades;
SELECT *
FROM discipline;
SELECT *
FROM coefficients;

-- ВСТАВКА ДАННЫХ

SELECT *
FROM discipline;
-- Вставка данных в таблицу 'Discipline'
INSERT INTO discipline
VALUES (discipline_seq.nextval, 'Математика');
INSERT INTO discipline
VALUES (discipline_seq.nextval, 'Физика');
INSERT INTO discipline
VALUES (discipline_seq.nextval, 'Русский язык');
-- Конец вставки данных в таблицу 'Discipline'

SELECT *
FROM students;
-- Начало вставки данных в таблицу 'Students'
INSERT INTO students
VALUES (student_seq.nextval, 'Бекзод',
        'Абдурашидов', 'Аскаругли');
INSERT INTO students
VALUES (student_seq.nextval, 'Дарья',
        'Акимова', 'Денисовна');
INSERT INTO students
VALUES (student_seq.nextval, 'Евгений',
        'Басов', 'Романович');
INSERT INTO students
VALUES (student_seq.nextval, 'Дмитрий',
        'Винокуров', 'Антонович');
INSERT INTO students
VALUES (student_seq.nextval, 'Артем',
        'Голубков', 'Андреевич');
-- Конец вставки данных в таблицу 'Students'

SELECT *
FROM grades;
-- Конец вставки данных в таблицу 'Grades'
-- Params: id, student_year, semestr, grade, student, discipline
-- Student 1
INSERT INTO grades
VALUES (grade_seq.nextval, '2015.09.01',
        2, 5, 13, 6);
INSERT INTO grades
VALUES (grade_seq.nextval, '2015.09.01',
        2, 4, 13, 7);
INSERT INTO grades
VALUES (grade_seq.nextval, '2015.09.01',
        2, 2, 13, 8);
-- Student 2
-- Params: id, student_year, semestr, grade, student_id, discipline
INSERT INTO grades
VALUES (grade_seq.nextval, '2016.09.01',
        3, 2, 14, 6);
INSERT INTO grades
VALUES (grade_seq.nextval, '2016.09.01',
        3, 3, 14, 7);
-- Student 3
-- Params: id, student_year, semestr, grade, student_id, discipline
INSERT INTO grades
VALUES (grade_seq.nextval, '2014.09.01',
        1, 4, 15, 6);
INSERT INTO grades
VALUES (grade_seq.nextval, '2014.09.01',
        1, 3, 15, 7);
INSERT INTO grades
VALUES (grade_seq.nextval, '2014.09.01',
        1, 5, 15, 8);
-- Student 4
-- Params: id, student_year, semestr, grade, student_id, discipline
INSERT INTO grades
VALUES (grade_seq.nextval, '2016.09.01',
        3, 5, 16, 6);
INSERT INTO grades
VALUES (grade_seq.nextval, '2016.09.01',
        3, 4, 16, 7);
-- Student 5
-- Params: id, student_year, semestr, grade, student_id, discipline
INSERT INTO grades
VALUES (grade_seq.nextval, '2015.09.01',
        2, 5, 17, 6);
INSERT INTO grades
VALUES (grade_seq.nextval, '2015.09.01',
        2, 4, 17, 7);
-- Конец вставки данных в таблицу 'Grades'

SELECT *
FROM coefficients;
-- Начало вставки данных в таблицу 'Coefficient'
-- Params: id, study_year, semestr,
-- coef_lower, coef_middle, coef_upper, min_salary
INSERT INTO coefficients
VALUES (coefficient_seq.nextval, '2014.09.01', 2,
        SELECT student_id,
        (SELECT round(avg(grade), 1)
         FROM grades g
         WHERE g.student_id = s.student_id)
         FROM students,
        coef_middle, coef_upper, min_salary);
INSERT INTO coefficients
-- Конец вставки данных в таблицу 'Coefficients'


-- Запросы

-- Задание 1


-- Задание 2
  SELECT substr(first_name, 1, 1) || '.' || substr(second_name, 1, 1) || '. ' || last_name
  FROM students;

-- Задание 3
SELECT
  student_id,
  (SELECT round(avg(grade), 1)
   FROM grades g
   WHERE g.student_id = s.student_id) AS grade_avg
FROM students s;

-- Задание 4

-- Задание 5
-- select substr(first_name, 1, 1) || '.' || substr(second_name, 1, 1) || '. ' || last_name
-- from students
-- where student_id =
-- (select student_id
-- from

-- Задание 6

-- Задание 7

-- Задание 8