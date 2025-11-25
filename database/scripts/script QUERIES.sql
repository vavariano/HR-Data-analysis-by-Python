##QUERY SOCIODEMOGRAFICA##
SELECT * FROM candidate;
SELECT * FROM candidate AS cd WHERE cd.country = 'United States of America';
SELECT COUNT(candidate_id) AS total_candidatos_US FROM candidate AS cd WHERE cd.country = 'United States of America';
SELECT gender, COUNT(*) AS total FROM candidate  AS cd WHERE cd.country = 'United States of America' GROUP BY gender;
SELECT age, COUNT(*) AS total FROM candidate AS cd WHERE cd.country = 'United States of America' GROUP BY age;

##QUERY NIVEL EDUCATIVO VS ESTADO DE EMPLEABILIDAD
SELECT * FROM educational_information;
SELECT ei.edlevel, COUNT(*) AS total FROM candidate AS cd
LEFT JOIN educational_information AS ei ON cd.candidate_id = ei.candidate_id
WHERE cd.country = 'United States of America'
GROUP BY edlevel;

SELECT * FROM recruitment_information;
SELECT * FROM educational_information;

SELECT ei.edlevel, ri.employed, COUNT(*) AS total_candidatos FROM candidate AS cd
LEFT JOIN educational_information AS ei ON cd.candidate_id = ei.candidate_id
LEFT JOIN recruitment_information AS ri ON ei.candidate_id = ri.candidate_id
WHERE cd.country = 'United States of America'
GROUP BY ei.edlevel, ri.employed
ORDER BY ei.edlevel, ri.employed;

#QUERY TOP 10 SKILLS

SELECT * FROM skills;
SELECT * FROM work_skills;

SELECT sk.skill_name, COUNT(*) AS total FROM candidate AS cd
LEFT JOIN work AS w ON w.candidate_id = cd.candidate_id
LEFT JOIN work_skills AS wsk ON w.work_id = wsk.work_id
LEFT JOIN skills AS sk ON wsk.skills_id = sk.skills_id
WHERE cd.country = 'United States of America'
GROUP BY sk.skill_name
ORDER BY total DESC LIMIT 10;

SELECT sk.skill_name, COUNT(*) AS total FROM candidate AS cd
LEFT JOIN work AS w ON w.candidate_id = cd.candidate_id
LEFT JOIN work_skills AS wsk ON w.work_id = wsk.work_id
LEFT JOIN skills AS sk ON wsk.skills_id = sk.skills_id
WHERE cd.country = 'United States of America'
GROUP BY sk.skill_name
ORDER BY total ASC LIMIT 10;

#JOIN PARA NULOS
SELECT sk.skill_name, COUNT(*) AS datos_nulos FROM work_skills AS wsk
LEFT JOIN skills AS sk ON wsk.skills_id = sk.skills_id
WHERE sk.skill_name IS NULL
GROUP BY sk.skills_id;

SELECT w.work_id, sk.skill_name, cd.country AS total FROM candidate AS cd
LEFT JOIN work AS w ON w.candidate_id = cd.candidate_id
LEFT JOIN work_skills AS wsk ON w.work_id = wsk.work_id
LEFT JOIN skills AS sk ON wsk.skills_id = sk.skills_id
WHERE sk.skill_name IS NULL AND cd.country != 'United States of America' 
GROUP BY sk.skill_name, w.work_id, cd.country
ORDER BY total ASC LIMIT 10;

SELECT * FROM work
WHERE work_id = 73405 OR work_id = 73445 OR work_id = 73456 OR work_id = 73447;

SELECT COUNT(work_skills_id) FROM work_skills
WHERE work_skills_id IS NULL;

SELECT w.work_id, sk.skill_name, cd.country AS total FROM candidate AS cd
LEFT JOIN work AS w ON w.candidate_id = cd.candidate_id
LEFT JOIN work_skills AS wsk ON w.work_id = wsk.work_id
LEFT JOIN skills AS sk ON wsk.skills_id = sk.skills_id
WHERE sk.skill_name IS NULL AND cd.country = 'Czech Republic' 
GROUP BY sk.skill_name, w.work_id, cd.country
ORDER BY total ASC LIMIT 10; 

