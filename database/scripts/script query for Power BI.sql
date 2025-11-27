#QUERIES PARA POWER BI / CARGA DE BASE DE DATOS SEGMENTADA

#CANDIDATES
SELECT * FROM candidate
WHERE country = 'United States of America';

#EDUCATIONAL_INFORMATION
SELECT ei.education_id, ei.edlevel, ei.candidate_id FROM educational_information AS ei
LEFT JOIN candidate AS cd ON ei.candidate_id = cd.candidate_id
WHERE country = 'United States of America';

#RECRUITMENT_INFORMATION
SELECT `recruitment_information`.`recruitment_id`,
    `recruitment_information`.`previous_salary`,
    `recruitment_information`.`employed`,
    `recruitment_information`.`mental_health`,
    `recruitment_information`.`candidate_id`
    FROM `hr_data_project`.`recruitment_information`, `hr_data_project`.`candidate`
    WHERE `candidate`.`candidate_id` = `recruitment_information`.`candidate_id` AND country = 'United States of America';
    
#WORK
SELECT `work`.`work_id`,
    `work`.`years_code`,
    `work`.`years_code_pro`,
    `work`.`computer_skills`,
    `work`.`main_branch`,
    `work`.`candidate_id`
FROM `hr_data_project`.`work`
LEFT JOIN candidate AS cd ON cd.candidate_id = `work`.`candidate_id`
WHERE country = 'United States of America';

#WORK_SKILLS

SELECT `work_skills`.`work_skills_id`,
    `work_skills`.`skills_id`,
    `work_skills`.`work_id`
FROM `hr_data_project`.`work_skills`
LEFT JOIN work AS w ON `work_skills`.`work_id` = w.work_id
LEFT JOIN candidate AS cd ON w.candidate_id = cd.candidate_id
WHERE country = 'United States of America';

#SKILLS
SELECT `skills`.`skills_id`,
    `skills`.`skill_name`
FROM `hr_data_project`.`skills`
LEFT JOIN work_skills AS ws ON `skills`.`skills_id` = ws.skills_id
LEFT JOIN work AS w ON ws.`work_id` = w.work_id
LEFT JOIN candidate AS cd ON w.candidate_id = cd.candidate_id
WHERE country = 'United States of America';




 