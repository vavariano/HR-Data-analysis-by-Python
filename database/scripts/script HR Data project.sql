CREATE DATABASE IF NOT EXISTS hr_data_project;
USE hr_data_project;
CREATE TABLE Candidate (
	candidate_id INT PRIMARY KEY AUTO_INCREMENT,
    age CHAR(5),
    gender CHAR(10),
    country CHAR(100)
);

CREATE TABLE Educational_Information (
	education_id INT PRIMARY KEY AUTO_INCREMENT,
    edlevel CHAR(100),
    candidate_id INT,
    FOREIGN KEY (candidate_id) REFERENCES Candidate(candidate_id) ON DELETE CASCADE ON UPDATE CASCADE 
    );
  
CREATE TABLE Recruitment_Information (
	recruitment_id INT PRIMARY KEY AUTO_INCREMENT,
    previous_salary FLOAT,
    employed BOOLEAN,
    mental_health CHAR(10),
    candidate_id INT,
    FOREIGN KEY (candidate_id) REFERENCES Candidate(candidate_id) ON DELETE CASCADE ON UPDATE CASCADE 
    );
    
CREATE TABLE Work (
	work_id INT PRIMARY KEY AUTO_INCREMENT,
    years_code INT(3),
    years_code_pro INT(3),
    computer_skills INT(5),
    main_branch CHAR(10),
    candidate_id INT,
    FOREIGN KEY (candidate_id) REFERENCES Candidate(candidate_id) ON DELETE CASCADE ON UPDATE CASCADE 
    );
    
 CREATE TABLE Skills (
	skills_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(100)
    );
    
    
    CREATE TABLE Work_skills (
	work_skills_id INT PRIMARY KEY AUTO_INCREMENT,
    skills_id INT,
    work_id INT,
    FOREIGN KEY (skills_id) REFERENCES Skills(skills_id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (work_id) REFERENCES Work(work_id) ON DELETE CASCADE ON UPDATE CASCADE 
    );