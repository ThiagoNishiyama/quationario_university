-- =====================================================
-- Questão 1
-- Criar uma relação a partir da união (join) das tabelas
-- student e takes.
-- =====================================================
SELECT 
    s.ID,
    s.name,
    s.dept_name,
    s.tot_cred,
    t.course_id,
    t.sec_id,
    t.semester,
    t.year,
    t.grade
FROM student s
INNER JOIN takes t
    ON s.ID = t.ID;


-- =====================================================
-- Questão 2
-- Contar a quantidade de cursos realizados pelos alunos
-- do departamento de Civil Eng.
-- Ordenar de maneira decrescente pela quantidade.
-- =====================================================
SELECT 
    s.ID,
    s.name,
    COUNT(t.course_id) AS "Quantidade de cursos"
FROM student s
INNER JOIN takes t
    ON s.ID = t.ID
WHERE s.dept_name = 'Civil Eng.'
GROUP BY s.ID, s.name
ORDER BY "Quantidade de cursos" DESC;


-- =====================================================
-- Questão 3
-- Criar uma view chamada civil_eng_students a partir
-- da relação construída na Questão 2.
-- =====================================================
CREATE VIEW civil_eng_students AS
SELECT 
    s.ID,
    s.name,
    COUNT(t.course_id) AS quantidade_cursos
FROM student s
INNER JOIN takes t
    ON s.ID = t.ID
WHERE s.dept_name = 'Civil Eng.'
GROUP BY s.ID, s.name;


-- =====================================================
-- Consulta para testar a view criada
-- =====================================================
SELECT *
FROM civil_eng_students
ORDER BY quantidade_cursos DESC;
