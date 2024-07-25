CREATE SCHEMA IF NOT EXISTS dds_data;

CREATE TABLE dds_data."employees" (
    id serial PRIMARY KEY,
    "activity" varchar(3),
    "job_title" text,
    "department" text,
    "last_auth" timestamp without time zone,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_databases" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_tools" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_industries" (
    id serial PRIMARY KEY,
    "name" text,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_platforms" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_subjects" (
    id serial PRIMARY KEY,
    "name" text,
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
    "name" text,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_subject_knowledge_levels" (
    id serial PRIMARY KEY,
    "name" text,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_frameworks" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_technologies" (
    id serial PRIMARY KEY,
    "name" text,
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_system_types" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_languages" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_programming_languages" (
    id serial PRIMARY KEY,
    "name" character varying(50),
    "last_update" timestamp without time zone
);

CREATE TABLE dds_data."d_ide" (
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
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_db_id FOREIGN KEY("db_id") REFERENCES dds_data."d_databases"(id),
    CONSTRAINT fk_knowledge_id FOREIGN KEY("knowledge_id") REFERENCES dds_data."d_knowledge_levels"(id)
);

CREATE TABLE dds_data."employee_tool_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "tool_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_tool_id FOREIGN KEY("tool_id") REFERENCES dds_data."d_tools"(id),
    CONSTRAINT fk_knowledge_id FOREIGN KEY("knowledge_id") REFERENCES dds_data."d_knowledge_levels"(id)
);

CREATE TABLE dds_data."employee_education" (
    id serial PRIMARY KEY,
    "user_id" integer,
    "education_level_id" int,
    "institution" text,
    "specialty" text,
    "grad_year" integer,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_education_level_id FOREIGN KEY("education_level_id") REFERENCES dds_data."d_education_levels"(id)
);

CREATE TABLE dds_data."employee_industry_experience" (
    id serial PRIMARY KEY,
    "user_id" int,
    "industry_id" int,
    "industry_knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_industry_id FOREIGN KEY("industry_id") REFERENCES dds_data."d_industries"(id),
    CONSTRAINT fk_industry_knowledge_id FOREIGN KEY("industry_knowledge_id") REFERENCES dds_data."d_industry_knowledge_levels"(id)
);

CREATE TABLE dds_data."employee_subject_experience" (
    id serial PRIMARY KEY,
    "user_id" int,
    "subject_id" int,
    "subject_knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_subject_id FOREIGN KEY("subject_id") REFERENCES dds_data."d_subjects"(id),
    CONSTRAINT fk_subject_knowledge_id FOREIGN KEY("subject_knowledge_id") REFERENCES dds_data."d_subject_knowledge_levels"(id)
);

CREATE TABLE dds_data."employee_platform_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "platform_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_platform_id FOREIGN KEY("platform_id") REFERENCES dds_data."d_platforms"(id),
    CONSTRAINT fk_knowledge_id FOREIGN KEY("knowledge_id") REFERENCES dds_data."d_knowledge_levels"(id)
);

CREATE TABLE dds_data."employee_certificates" (
    id serial PRIMARY KEY,
    "user_id" integer,
    "certificate_name" text,
    "issuer" text,
    "certification_year" integer,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id)
);

CREATE TABLE dds_data."employee_ide_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "ide_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_ide_id FOREIGN KEY("ide_id") REFERENCES dds_data."d_ide"(id),
    CONSTRAINT fk_knowledge_id FOREIGN KEY("knowledge_id") REFERENCES dds_data."d_knowledge_levels"(id)
);

CREATE TABLE dds_data."employee_tech_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "tech_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_tech_id FOREIGN KEY("tech_id") REFERENCES dds_data."d_technologies"(id),
    CONSTRAINT fk_knowledge_id FOREIGN KEY("knowledge_id") REFERENCES dds_data."d_knowledge_levels"(id)
);

CREATE TABLE dds_data."employee_system_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "system_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_system_id FOREIGN KEY("system_id") REFERENCES dds_data."d_system_types"(id),
    CONSTRAINT fk_knowledge_id FOREIGN KEY("knowledge_id") REFERENCES dds_data."d_knowledge_levels"(id)
);

CREATE TABLE dds_data."employee_framework_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "framework_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_framework_id FOREIGN KEY("framework_id") REFERENCES dds_data."d_frameworks"(id),
    CONSTRAINT fk_knowledge_id FOREIGN KEY("knowledge_id") REFERENCES dds_data."d_knowledge_levels"(id)
);

CREATE TABLE dds_data."employee_languages" (
    id serial PRIMARY KEY,
    "user_id" int,
    "language_id" int,
    "language_level_id" int,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_language_id FOREIGN KEY("language_id") REFERENCES dds_data."d_languages"(id),
    CONSTRAINT fk_language_level_id FOREIGN KEY("language_level_id") REFERENCES dds_data."d_language_levels"(id)
);

CREATE TABLE dds_data."employee_programming_skills" (
    id serial PRIMARY KEY,
    "user_id" int,
    "programming_id" int,
    "knowledge_id" int,
    "date" date,
    "last_update" timestamp without time zone,
    CONSTRAINT fk_user_id FOREIGN KEY("user_id") REFERENCES dds_data."employees"(id),
    CONSTRAINT fk_programming_id FOREIGN KEY("programming_id") REFERENCES dds_data."d_programming_languages"(id),
    CONSTRAINT fk_knowledge_id FOREIGN KEY("knowledge_id") REFERENCES dds_data."d_knowledge_levels"(id)
);

CREATE TABLE dds_data."resumes" (
    "resume_id" serial PRIMARY KEY,
    "user_id" integer
);


