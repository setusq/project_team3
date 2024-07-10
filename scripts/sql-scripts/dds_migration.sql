--
-- Вставка данных в справочные материалы
--


INSERT INTO dds_data.d_databases  
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."базы_данных";

INSERT INTO dds_data.d_tools
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."инструменты";

INSERT INTO dds_data.d_industries
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."отрасли";

INSERT INTO dds_data.d_platforms
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."платформы";

INSERT INTO dds_data.d_subjects
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."предметная_область";

-- дополнение к образованию

-- - / Не указано 148161

-- Высшее/Высшее образование 177799

-- бакалавр/Высшее(бакалавриат) 76387

-- неполное% 177801

-- профессилнальная подго% 177807


INSERT INTO dds_data.d_education_levels
SELECT 
    id, 
    CASE 
    WHEN название LIKE '%образование' THEN 
        TRIM(TRAILING 'образование' FROM название)
    ELSE 
        название 
	END, 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."уровень_образования"
WHERE название NOT IN ('-', 'Неполное высшее образовани]', 'Высшее образование', 'Бакалавр', 'Неполное высшее', 'Профессиональная подготов')
;


INSERT INTO dds_data.d_language_levels
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."уровни_владения_ин";

INSERT INTO dds_data.d_knowledge_levels
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."уровни_знаний";

INSERT INTO dds_data.d_industry_knowledge_levels
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."уровни_знаний_в_отрасли";

INSERT INTO dds_data.d_subject_knowledge_levels
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."уровни_знаний_в_предметной_област";

INSERT INTO dds_data.d_frameworks
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."фреймворки";

INSERT INTO dds_data.d_technologies
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."технологии";


INSERT INTO dds_data.d_system_types
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."типы_систем";

INSERT INTO dds_data.d_languages
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."языки";

INSERT INTO dds_data.d_programming_languages
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."языки_программирования";


INSERT INTO dds_data.d_ide
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."среды_разработки";


--- вставка сотрудников

--- если предложат вариант решения пропусков в последней авторизации - добавить

--- изменить в джойне ods на dds для сотрудников
INSERT INTO dds_data.employees
SELECT id,
       активность,
       CASE
           WHEN должность = '-'
                OR должность = '' THEN 'не указана'
           ELSE должность
       END,
       REPLACE(подразделения, '.', ''),
       TO_TIMESTAMP("Последняя авторизация", 'DD-MM-YYYY HH24:MI:SS')
FROM ods_data."сотрудники_дар"
WHERE NOT ("Последняя авторизация" = '' AND активность = 'Нет') AND "цфо" = 'DAR';


-- - / Не указано 148161

-- Высшее/Высшее образование 175357

-- бакалавр/Высшее(бакалавриат) 76387

-- неполное% 177801

-- профессилнальная подго% 177807
--- образование и сертификаты
INSERT INTO dds_data."employee_education" 
SELECT o.id, "User ID", 
    CASE 
        WHEN "Уровень образование" LIKE 'Высшее образование%' THEN 175357
        WHEN "Уровень образование" LIKE '%Бакалавр%' THEN 76387
        WHEN "Уровень образование" LIKE 'Неполное%' THEN 177801
        WHEN "Уровень образование" LIKE 'Профессиональная подго%' THEN 177807
        WHEN "Уровень образование" LIKE '-%' THEN 148161
        ELSE CAST(regexp_replace("Уровень образование", '.*\[(\d+)\].*', '\1') AS INT)
    END,
	"Название учебного заведения",
	CASE WHEN "специальность" = '' THEN 'Не указано' ELSE специальность END,
	CASE WHEN "Год окончания" IS NULL THEN 0 ELSE "Год окончания" END,
    TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
FROM ods_data."образование_пользователей" o
JOIN dds_data."employees" s
ON s.id = o."User ID";


INSERT INTO dds_data."employee_certificates" 
SELECT o.id, "User ID", 
	"Наименование сертификата", 
	CASE WHEN
	"Организация, выдавшая сертификат" = '' THEN 'Не указано' ELSE "Организация, выдавшая сертификат" END, 
	"Год сертификата", 
	TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
FROM ods_data."сертификаты_пользователей" o
JOIN dds_data."employees" s
ON s.id = o."User ID";

--- навыки сотрудников ---

INSERT INTO dds_data."employee_db_skills" 
SELECT o.id, 
	CAST(SUBSTRING(название FROM '\d+') as INT),
	CAST(regexp_replace("Базы данных", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
    END, 
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."базы_данных_и_уровень_знаний_сотру" o
JOIN dds_data."employees" s
ON s.id = CAST(SUBSTRING(название FROM '\d+') as INT)
WHERE "Уровень знаний" <> '' AND  "дата" <> '';



INSERT INTO dds_data."employee_tool_skills" 
SELECT o.id, 
	CAST(SUBSTRING(название FROM '\d+') as INT),
	CAST(regexp_replace("инструменты", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
    END, 
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."инструменты_и_уровень_знаний_сотр" o
JOIN dds_data."employees" s
ON s.id = CAST(SUBSTRING(название FROM '\d+') as INT)
WHERE "Уровень знаний" <> '' AND  "дата" <> '' ;



INSERT INTO dds_data."employee_platform_skills" 
SELECT o.id, 
	"User ID",
	CAST(regexp_replace("платформы", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
    END, 
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."платформы_и_уровень_знаний_сотруд" o
JOIN dds_data."employees" s
ON s.id = o."User ID"
WHERE "Уровень знаний" <> '' AND  "дата" <> '';



INSERT INTO dds_data."employee_ide_skills" 
SELECT o.id, 
	CAST(SUBSTRING(название FROM '\d+') as INT),
	CAST(regexp_replace("Среды разработки", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
    END, 
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."среды_разработки_и_уровень_знаний_" o
JOIN dds_data."employees" s
ON s.id = CAST(SUBSTRING(название FROM '\d+') as INT)
WHERE "Уровень знаний" <> '' AND  "дата" <> '' ;



INSERT INTO dds_data."employee_tech_skills" 
SELECT o.id, 
	CAST(SUBSTRING(название FROM '\d+') as INT),
	CAST(regexp_replace("технологии", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
    END, 
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."технологии_и_уровень_знаний_сотру" o
JOIN dds_data."employees" s
ON s.id = CAST(SUBSTRING(название FROM '\d+') as INT)
WHERE "Уровень знаний" <> '' AND  "дата" <> '' ;


INSERT INTO dds_data."employee_system_skills" 
SELECT o.id, 
	CAST(SUBSTRING(название FROM '\d+') as INT),
	CAST(regexp_replace("Типы систем", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
    END, 
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."типы_систем_и_уровень_знаний_сотру" o
JOIN dds_data."employees" s
ON s.id = CAST(SUBSTRING(название FROM '\d+') as INT)
WHERE "Уровень знаний" <> '' AND  "дата" <> '' ;


INSERT INTO dds_data."employee_framework_skills" 
SELECT o.id, 
	CAST(SUBSTRING(название FROM '\d+') as INT),
	CAST(regexp_replace("фреймворки", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
    END, 
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."фреймворки_и_уровень_знаний_сотру" o
JOIN dds_data."employees" s
ON s.id = CAST(SUBSTRING(название FROM '\d+') as INT)
WHERE "Уровень знаний" <> '' AND  "дата" <> '' ;


INSERT INTO dds_data."employee_programming_skills" 
SELECT o.id, 
	CAST(SUBSTRING(название FROM '\d+') as INT),
	CAST(regexp_replace("Языки программирования", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
    END, 
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."языки_программирования_и_уровень" o
JOIN dds_data."employees" s
ON s.id = CAST(SUBSTRING(название FROM '\d+') as INT)
WHERE "Уровень знаний" <> '' AND  "дата" <> '' ;



INSERT INTO dds_data."employee_languages" 
SELECT o.id, 
	CAST(SUBSTRING(название FROM '\d+') as INT),
	CAST(regexp_replace("язык", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний ин. языка", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."языки_пользователей" o
JOIN dds_data."employees" s
ON s.id = CAST(SUBSTRING(название FROM '\d+') as INT)
WHERE "Уровень знаний ин. языка" <> '' ;


INSERT INTO dds_data."employee_industry_experience" 
SELECT o.id, 
	"User ID",
	CAST(regexp_replace("отрасли", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний в отрасли", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
    END, 
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."опыт_сотрудника_в_отраслях" o
JOIN dds_data."employees" s
ON s.id = o."User ID"
WHERE "Уровень знаний в отрасли" <> '' AND  "дата" <> '' ;


INSERT INTO dds_data."employee_subject_experience" 
SELECT o.id, 
	"User ID",
	CAST(regexp_replace("Предментые области", '.*\[(\d+)\].*', '\1') AS INT),
	CAST(regexp_replace("Уровень знаний в предметной облас", '.*\[(\d+)\].*', '\1') AS INT),
	CASE 
        WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
    END, 
	CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM ods_data."опыт_сотрудника_в_предметных_обла" o
JOIN dds_data."employees" s
ON s.id = o."User ID"
WHERE "Уровень знаний в предметной облас" <> '' AND  "дата" <> '' ;

INSERT INTO dds_data."resumes" 
SELECT r."ResumeID", 
	"UserID"
FROM ods_data."резюмедар" r
join dds_data."employees" s
on s.id = r."UserID" ;






