SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE SCHEMA IF NOT EXISTS dds_data;

SET default_tablespace = '';
SET default_table_access_method = heap;

CREATE TABLE dds_data."d_databases" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_db_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "db_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_tools" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_tool_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "tool_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_education" (
    id serial PRIMARY KEY,
    "user_id" integer,
    "education_level_id" int,
    "institution" text,
    "specialty" text,
    "grad_year" integer,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_industry_experience" (
    id serial PRIMARY KEY,
    "user_id" int,
    "industry_id" int,
    "industry_knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_subject_experience" (
    id serial PRIMARY KEY,
    "user_id" int,
    "subject_id" int,
    "subject_knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_industries" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_platforms" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_platform_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "platform_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_subjects" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."resumes" (
    "UserID" integer,
    "ResumeID" integer,
    "Активность" text,
    "Образование" text,
    "Сертификаты/Курсы" text,
    "Языки" text,
    "Базыданных" text,
    "Инструменты" text,
    "Отрасли" text,
    "Платформы" text,
    "Предметныеобласти" text,
    "Средыразработки" text,
    "Типысистем" text,
    "Фреймворки" text,
    "Языкипрограммирования" text,
    "Технологии" text
);

CREATE TABLE dds_data."employee_certificates" (
    id serial PRIMARY KEY,
    "user_id" integer,
    "certificate_name" text,
    "issuer" text,
    "certification_year" integer,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employees" (
    id serial PRIMARY KEY,
    "active" varchar(3),
    "job_title" text,
    "department" text,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_ide" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_ide_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "ide_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_technologies" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_tech_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "tech_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_system_types" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_system_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "system_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_education_levels" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_language_levels" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_knowledge_levels" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_industry_knowledge_levels" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_subject_knowledge_levels" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_frameworks" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_framework_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "framework_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_languages" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_languages" (
    id serial PRIMARY KEY,
    "user_id" int,
    "language_id" int,
    "language_level_id" int,
    "date" date,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_programming_languages" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."employee_programming_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "programming_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone
);
