##QUERY SOCIODEMOGRAFICA##
SELECT * FROM candidate;
SELECT * FROM candidate AS cd WHERE cd.country = 'United States of America';
SELECT COUNT(candidate_id) AS total_candidatos_US FROM candidate AS cd WHERE cd.country = 'United States of America';
SELECT gender, COUNT(*) AS total FROM candidate  AS cd WHERE cd.country = 'United States of America' GROUP BY gender;
SELECT age, COUNT(*) AS total FROM candidate AS cd WHERE cd.country = 'United States of America' GROUP BY age;

SELECT * FROM educational_information;
SELECT edlevel, COUNT(*) AS total FROM educational_information AS 