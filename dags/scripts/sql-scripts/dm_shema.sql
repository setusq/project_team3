CREATE SCHEMA IF NOT EXISTS dm_data;

CREATE TABLE dm_data.skill_types (
    id SERIAL PRIMARY KEY,
    skill_type VARCHAR(255) NOT NULL,
    last_update DATE
);

CREATE TABLE dm_data.skill_levels (
    id SERIAL PRIMARY KEY,
    level VARCHAR(50),
    level_num INT,
    last_update DATE
);

create table dm_data.skills(
	id SERIAL PRIMARY KEY,
	skill varchar(100),
	last_update date 
);

-- подразделения
CREATE TABLE IF NOT EXISTS dm_data.departments (
    id SERIAL PRIMARY KEY,
    department VARCHAR(255) NOT NULL UNIQUE,
    last_update DATE
);

-- должности
CREATE TABLE dm_data.job_titles (
    id SERIAL PRIMARY KEY,
    job_title VARCHAR(255) NOT NULL UNIQUE,
    last_update DATE
);

-- Сотрудники
CREATE TABLE dm_data.employees (
    id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR (50),
    activity VARCHAR(3),
    last_auth TIMESTAMP WITHOUT TIME ZONE,
    last_update DATE
);


-- Ключевые навыки по подразделению
create table dm_data.depart_key_skills(
	department_id INT,
	skill_type_id INT,
	skill_id INT
);

-- Ключевые навыки по должности 
create table dm_data.job_key_skills(
	job_title_id INT,
	skill_type_id INT,
	skill_id INT
);

-- Ключевые типы навыков по подразделению
CREATE TABLE dm_data.depart_key_skill_types (
    department_id INT,
    skill_type_id INT
);

-- Ключевые типы навыков по должности
CREATE TABLE dm_data.job_key_skill_types (
    job_title_id INT,
    skill_type_id INT
);
-- Ключевые навыки в типах навыков в должности
create table dm_data.job_key_skill_type_skills(
	job_title_id INT,
	skill_type_id INT,
	skill_id INT
);

CREATE TABLE dm_data.resume (
    user_id INT,
    job_title_id INT,
    department_id INT,
    skill_type_id INT,
    skill_id INT, 
    skill_level_id INT,
    skill_status VARCHAR(3),
    date DATE,
    is_depart_key_skill BOOLEAN,
    is_job_key_skill BOOLEAN,
    is_depart_key_skill_type BOOLEAN,
    is_job_key_skill_type BOOLEAN,
    is_job_key_skill_type_skill BOOLEAN,
	last_update DATE
);


