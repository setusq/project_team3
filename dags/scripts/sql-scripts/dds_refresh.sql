-- обновление данных в справочных таблицах навыков 

-- справочная таблица "d_databases"
WITH new_data AS (
    SELECT * 
    FROM ods_data.базы_данных
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_databases)
)
INSERT INTO dds_data.d_databases (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN id = 115705 AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() 
            THEN TO_TIMESTAMP('20.07.2023 12:57:28', 'DD-MM-YYYY HH24:MI:SS')
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = CASE 
        WHEN EXCLUDED.id = 115705 AND EXCLUDED.last_update > NOW() 
            THEN TO_TIMESTAMP('20.07.2023 12:57:28', 'DD-MM-YYYY HH24:MI:SS')
        ELSE EXCLUDED.last_update
    END
WHERE dds_data.d_databases.last_update < EXCLUDED.last_update;

-- справочная таблица "d_tools"
WITH new_data AS (
    SELECT * 
    FROM ods_data.инструменты
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_tools)
)
INSERT INTO dds_data.d_tools (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = CASE 
        WHEN EXCLUDED.last_update > NOW() THEN NOW()
        ELSE EXCLUDED.last_update
    END
WHERE dds_data.d_tools.last_update < EXCLUDED.last_update;

-- справочкая таблица "d_platforms"
WITH new_data AS (
    SELECT * 
    FROM ods_data.платформы
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_platforms)
)
INSERT INTO dds_data.d_platforms (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = CASE 
        WHEN EXCLUDED.last_update > NOW() THEN NOW()
        ELSE EXCLUDED.last_update
    END
WHERE dds_data.d_platforms.last_update < EXCLUDED.last_update;

-- справочная таблица "d_ide"
WITH new_data AS (
    SELECT * 
    FROM ods_data.среды_разработки
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_ide)
)
INSERT INTO dds_data.d_ide (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = CASE 
        WHEN EXCLUDED.last_update > NOW() THEN NOW()
        ELSE EXCLUDED.last_update
    END
WHERE dds_data.d_ide.last_update < EXCLUDED.last_update;

-- справочная таблица "d_technologies"
WITH new_data AS (
    SELECT * 
    FROM ods_data.технологии
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_technologies)
)
INSERT INTO dds_data.d_technologies (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = CASE 
        WHEN EXCLUDED.last_update > NOW() THEN NOW()
        ELSE EXCLUDED.last_update
    END
WHERE dds_data.d_technologies.last_update < EXCLUDED.last_update;

-- справочная таблица "d_system_types"
WITH new_data AS (
    SELECT * 
    FROM ods_data.типы_систем
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_system_types)
)
INSERT INTO dds_data.d_system_types (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = CASE 
        WHEN EXCLUDED.last_update > NOW() THEN NOW()
        ELSE EXCLUDED.last_update
    END
WHERE dds_data.d_system_types.last_update < EXCLUDED.last_update;

-- справочная таблица "d_frameworks"
WITH new_data AS (
    SELECT * 
    FROM ods_data.фреймворки
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_frameworks)
)
INSERT INTO dds_data.d_frameworks (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = CASE 
        WHEN EXCLUDED.last_update > NOW() THEN NOW()
        ELSE EXCLUDED.last_update
    END
WHERE dds_data.d_frameworks.last_update < EXCLUDED.last_update;

-- справочная таблица "d_programming_languages"
WITH new_data AS (
    SELECT * 
    FROM ods_data.языки_программирования
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_programming_languages)
)
INSERT INTO dds_data.d_programming_languages (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = CASE 
        WHEN EXCLUDED.last_update > NOW() THEN NOW()
        ELSE EXCLUDED.last_update
    END
WHERE dds_data.d_programming_languages.last_update < EXCLUDED.last_update;

-- справочная таблица "d_industries"
WITH new_data AS (
    SELECT * 
    FROM ods_data.отрасли
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_industries)
)
INSERT INTO dds_data.d_industries (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = CASE 
        WHEN EXCLUDED.last_update > NOW() THEN NOW()
        ELSE EXCLUDED.last_update
    END
WHERE dds_data.d_industries.last_update < EXCLUDED.last_update;

-- справочная таблица "d_subjects"
WITH new_data AS (
    SELECT * 
    FROM ods_data.предметная_область
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_subjects)
)
INSERT INTO dds_data.d_subjects (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = CASE 
        WHEN EXCLUDED.last_update > NOW() THEN NOW()
        ELSE EXCLUDED.last_update
    END
WHERE dds_data.d_subjects.last_update < EXCLUDED.last_update;

-- справочная таблица "d_languages"
WITH new_data AS (
    SELECT 
        id, 
        "название" AS name, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."языки"
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_languages)
)

INSERT INTO dds_data.d_languages (id, name, last_update)
SELECT 
    id, 
    name, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = EXCLUDED.last_update;


-- обновление данных в справочных таблицах уровней знаний

--- справочная таблица "d_industry_knowledge_levels"
WITH new_data AS (
    SELECT * 
    FROM ods_data.уровни_знаний_в_отрасли
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_industry_knowledge_levels)
)
INSERT INTO dds_data.d_industry_knowledge_levels (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = EXCLUDED.last_update;

-- справочная таблица "d_subject_knowledge_levels"
WITH new_data AS (
    SELECT * 
    FROM ods_data.уровни_знаний_в_предметной_област
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_subject_knowledge_levels)
)
INSERT INTO dds_data.d_subject_knowledge_levels (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = EXCLUDED.last_update;

-- справочная таблица "d_language_levels"
WITH new_data AS (
    SELECT * 
    FROM ods_data.уровни_владения_ин
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_language_levels)
)
INSERT INTO dds_data.d_language_levels (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = EXCLUDED.last_update;

-- справочная таблица "d_knowledge_levels"
WITH new_data AS (
    SELECT * 
    FROM ods_data.уровни_знаний
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_knowledge_levels)
)
INSERT INTO dds_data.d_knowledge_levels (id, name, last_update)
SELECT 
    id, 
    "название", 
    CASE 
        WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
        ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
    END
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = EXCLUDED.last_update;

-- справочная таблица "d_education_levels"
WITH new_data AS (
    SELECT 
        id, 
        CASE 
        WHEN название LIKE '%образование' THEN 
            TRIM(TRAILING 'образование' FROM название)
        ELSE 
            название 
        END AS name, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."уровень_образования"
    WHERE название NOT IN ('-', 'Неполное высшее образовани]', 'Высшее образование', 'Бакалавр', 'Неполное высшее', 'Профессиональная подготов')
	AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_education_levels)
)
INSERT INTO dds_data.d_education_levels (id, name, last_update)
SELECT 
    id, 
    name, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    last_update = EXCLUDED.last_update;

-- обновление данных в таблице сотрудников
WITH new_data AS (
    SELECT 
        id,
        активность as activity,
        CASE
            WHEN должность = '-' OR должность = '' THEN 'не указана'
            ELSE должность
        END AS job_title,
        LTRIM(REGEXP_REPLACE(REPLACE(подразделения, '.', ''), '\s+', ' ', 'g')) AS dep,
        TO_TIMESTAMP("Последняя авторизация", 'DD-MM-YYYY HH24:MI:SS') AS last_auth,
		CASE 
        WHEN TO_TIMESTAMP("Дата изменения", 'DD-MM-YYYY HH24:MI:SS') > NOW() or "Дата изменения" = '' THEN NOW()
        ELSE TO_TIMESTAMP("Дата изменения", 'DD-MM-YYYY HH24:MI:SS')
   		END as last_update
    FROM ods_data."сотрудники_дар"
    WHERE NOT ("Последняя авторизация" = '' AND активность = 'Нет') AND "цфо" = 'DAR' 
	AND TO_TIMESTAMP("Дата изменения", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data.d_databases)
), formatted_data AS (
    SELECT 
        id, 
        activity, 
        job_title,
        CASE 
            WHEN dep LIKE 'Data Platform группа%' THEN 'Направление DWH&ML / Data Platform: Центр компетенций / ' || dep
            WHEN dep LIKE 'Data Platform: Центр компетенций%' THEN 'Направление DWH&ML / ' || dep
            WHEN dep LIKE 'Направление BI%' THEN 'Импортозамещенные технологии BI: Центр компетенций / Группа Центров Компетенций / ' || dep
            WHEN dep LIKE 'Группа Центров Компетенций%' THEN 'Импортозамещенные технологии BI: Центр компетенций / ' || dep
            ELSE dep
        END AS dep,
        last_auth,
		last_update
    FROM new_data
)
INSERT INTO dds_data.employees 
SELECT 
    id, 
    activity, 
    job_title, 
    dep, 
    last_auth,
	last_update
FROM formatted_data
ON CONFLICT (id) DO UPDATE SET
    activity = EXCLUDED.activity,
    job_title = EXCLUDED.job_title,
    department = EXCLUDED.department,
    last_auth = EXCLUDED.last_auth,
	last_update = EXCLUDED.last_update;



-- обновление данных в таблицах навыков сотрудников

-- таблица навыков "employee_db_skills"
WITH new_data AS (
    SELECT 
        o.id, 
        CAST(SUBSTRING(название FROM '\d+') as INT) AS user_id,
        CAST(regexp_replace("Базы данных", '.*\[(\d+)\].*', '\1') AS INT) AS db_id,
        CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT) AS knowledge_id,
        CASE 
            WHEN дата = '01.02.2221' THEN TO_TIMESTAMP('01.02.2021', 'DD-MM-YYYY HH24:MI:SS')
            WHEN дата = '20.07.2123' THEN TO_TIMESTAMP('01.02.2023', 'DD-MM-YYYY HH24:MI:SS')
            WHEN дата = '01.04.2119' THEN TO_TIMESTAMP('01.04.2019', 'DD-MM-YYYY HH24:MI:SS')
            ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
        END AS date, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."базы_данных_и_уровень_знаний_сотру" o
    JOIN dds_data."employees" s
    ON s.id = CAST(SUBSTRING(название FROM '\d+') as INT)
    WHERE "Уровень знаний" <> '' AND "дата" <> '' 
    AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_db_skills" )

)
INSERT INTO dds_data."employee_db_skills" 
SELECT 
    id, 
    user_id, 
    db_id, 
    knowledge_id, 
    date, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    db_id = EXCLUDED.db_id,
    knowledge_id = EXCLUDED.knowledge_id,
    date = EXCLUDED.date,
    last_update = EXCLUDED.last_update;

-- таблица навыков "employee_tool_skills"
WITH new_data AS (
    SELECT 
        o.id, 
        CAST(SUBSTRING(название FROM '\d+') AS INT) AS user_id,
        CAST(regexp_replace("инструменты", '.*\[(\d+)\].*', '\1') AS INT) AS tool_id,
        CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT) AS knowledge_id,
        CASE 
            WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
        END AS date, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."инструменты_и_уровень_знаний_сотр" o
    JOIN dds_data."employees" s
    ON s.id = CAST(SUBSTRING(название FROM '\d+') AS INT)
    WHERE "Уровень знаний" <> '' AND "дата" <> ''
    AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_tool_skills")
)
INSERT INTO dds_data."employee_tool_skills" (id, user_id, tool_id, knowledge_id, date, last_update)
SELECT 
    id, 
    user_id, 
    tool_id, 
    knowledge_id, 
    date, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    tool_id = EXCLUDED.tool_id,
    knowledge_id = EXCLUDED.knowledge_id,
    date = EXCLUDED.date,
    last_update = EXCLUDED.last_update;

-- таблица навыков "employee_platform_skills"
WITH new_data AS (
    SELECT 
        o.id, 
        o."User ID" AS user_id,
        CAST(regexp_replace("платформы", '.*\[(\d+)\].*', '\1') AS INT) AS platform_id,
        CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT) AS knowledge_id,
        CASE 
            WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
        END AS date, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."платформы_и_уровень_знаний_сотруд" o
    JOIN dds_data."employees" s
    ON s.id = o."User ID"
    WHERE "Уровень знаний" <> '' AND "дата" <> '' 
    AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_platform_skills")
)
INSERT INTO dds_data."employee_platform_skills" (id, user_id, platform_id, knowledge_id, date, last_update)
SELECT 
    id, 
    user_id, 
    platform_id, 
    knowledge_id, 
    date, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    platform_id = EXCLUDED.platform_id,
    knowledge_id = EXCLUDED.knowledge_id,
    date = EXCLUDED.date,
    last_update = EXCLUDED.last_update;

-- таблица навыков "employee_ide_skills"
WITH new_data AS (
    SELECT 
        o.id, 
        CAST(SUBSTRING(название FROM '\d+') AS INT) AS user_id,
        CAST(regexp_replace("Среды разработки", '.*\[(\d+)\].*', '\1') AS INT) AS ide_id,
        CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT) AS knowledge_id,
        CASE 
            WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
        END AS date, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."среды_разработки_и_уровень_знаний_" o
    JOIN dds_data."employees" s
    ON s.id = CAST(SUBSTRING(название FROM '\d+') AS INT)
    WHERE "Уровень знаний" <> '' AND "дата" <> '' 
    AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_ide_skills")
)
INSERT INTO dds_data."employee_ide_skills" (id, user_id, ide_id, knowledge_id, date, last_update)
SELECT 
    id, 
    user_id, 
    ide_id, 
    knowledge_id, 
    date, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    ide_id = EXCLUDED.ide_id,
    knowledge_id = EXCLUDED.knowledge_id,
    date = EXCLUDED.date,
    last_update = EXCLUDED.last_update;

-- таблица навыков "employee_tech_skills"
WITH new_data AS (
    SELECT 
        o.id, 
        CAST(SUBSTRING(название FROM '\d+') AS INT) AS user_id,
        CAST(regexp_replace("технологии", '.*\[(\d+)\].*', '\1') AS INT) AS tech_id,
        CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT) AS knowledge_id,
        CASE 
            WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
        END AS date, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."технологии_и_уровень_знаний_сотру" o
    JOIN dds_data."employees" s
    ON s.id = CAST(SUBSTRING(название FROM '\d+') AS INT)
    WHERE "Уровень знаний" <> '' AND "дата" <> '' 
    AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_tech_skills")
)
INSERT INTO dds_data."employee_tech_skills" (id, user_id, tech_id, knowledge_id, date, last_update)
SELECT 
    id, 
    user_id, 
    tech_id, 
    knowledge_id, 
    date, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    tech_id = EXCLUDED.tech_id,
    knowledge_id = EXCLUDED.knowledge_id,
    date = EXCLUDED.date,
    last_update = EXCLUDED.last_update;

-- таблица навыков "employee_system_skills"
WITH new_data AS (
    SELECT 
        o.id, 
        CAST(SUBSTRING(название FROM '\d+') AS INT) AS user_id,
        CAST(regexp_replace("Типы систем", '.*\[(\d+)\].*', '\1') AS INT) AS system_id,
        CAST(regexp_replace("Уровень знаний", '.*\[(\д+)\].*', '\1') AS INT) AS knowledge_id,
        CASE 
            WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
        END AS date, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."типы_систем_и_уровень_знаний_сотру" o
    JOIN dds_data."employees" s
    ON s.id = CAST(SUBSTRING(название FROM '\d+') AS INT)
    WHERE "Уровень знаний" <> '' AND "дата" <> '' 
    AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_system_skills")
)
INSERT INTO dds_data."employee_system_skills"
SELECT 
    id, 
    user_id, 
    system_id, 
    knowledge_id, 
    date, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    system_id = EXCLUDED.system_id,
    knowledge_id = EXCLUDED.knowledge_id,
    date = EXCLUDED.date,
    last_update = EXCLUDED.last_update;

-- таблица навыков "employee_framework_skills"
WITH new_data AS (
    SELECT 
        o.id, 
        CAST(SUBSTRING(название FROM '\d+') AS INT) AS user_id,
        CAST(regexp_replace("фреймворки", '.*\[(\d+)\].*', '\1') AS INT) AS framework_id,
        CAST(regexp_replace("Уровень знаний", '.*\[(\д+)\].*', '\1') AS INT) AS knowledge_id,
        CASE 
            WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
        END AS date, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."фреймворки_и_уровень_знаний_сотру" o
    JOIN dds_data."employees" s
    ON s.id = CAST(SUBSTRING(название FROM '\д+') AS INT)
    WHERE "Уровень знаний" <> '' AND "дата" <> '' 
    AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_framework_skills")
)
INSERT INTO dds_data."employee_framework_skills" (id, user_id, framework_id, knowledge_id, date, last_update)
SELECT 
    id, 
    user_id, 
    framework_id, 
    knowledge_id, 
    date, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    framework_id = EXCLUDED.framework_id,
    knowledge_id = EXCLUDED.knowledge_id,
    date = EXCLUDED.date,
    last_update = EXCLUDED.last_update;

-- таблица навыков "employee_programming_skills"
WITH new_data AS (
    SELECT 
        o.id, 
        CAST(SUBSTRING(название FROM '\d+') AS INT) AS user_id,
        CAST(regexp_replace("Языки программирования", '.*\[(\d+)\].*', '\1') AS INT) AS programming_id,
        CAST(regexp_replace("Уровень знаний", '.*\[(\d+)\].*', '\1') AS INT) AS knowledge_id,
        CASE 
            WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
        END AS date, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."языки_программирования_и_уровень" o
    JOIN dds_data."employees" s
    ON s.id = CAST(SUBSTRING(название FROM '\d+') AS INT)
    WHERE "Уровень знаний" <> '' AND "дата" <> '' 
    AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_programming_skills")
)
INSERT INTO dds_data."employee_programming_skills" 
SELECT 
    id, 
    user_id, 
    programming_id, 
    knowledge_id, 
    date, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    programming_id = EXCLUDED.programming_id,
    knowledge_id = EXCLUDED.knowledge_id,
    date = EXCLUDED.date,
    last_update = EXCLUDED.last_update;

-- таблица языковых навыков "employee_languages"  -- необходимо проверить 
WITH new_data AS (
    SELECT 
        o.id, 
        CAST(SUBSTRING(название FROM '\d+') AS INT) AS user_id,
        CAST(regexp_replace("язык", '.*\[(\d+)\].*', '\1') AS INT) AS language_id,
        CAST(regexp_replace("Уровень знаний ин. языка", '.*\[(\d+)\].*', '\1') AS INT) AS language_level_id,
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."языки_пользователей" o
    JOIN dds_data."employees" s
    ON s.id = CAST(SUBSTRING(название FROM '\d+') AS INT)
    WHERE "Уровень знаний ин. языка" <> '' 
	AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_languages")
)
INSERT INTO dds_data."employee_languages" 
SELECT 
    id, 
    user_id, 
    language_id, 
    language_level_id, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    language_id = EXCLUDED.language_id,
    language_level_id = EXCLUDED.language_level_id,
    last_update = EXCLUDED.last_update;

-- обновление данных в таблицах опыта сотрудников

-- таблица опыта "employee_industry_experience"
WITH new_data AS (
    SELECT 
        o.id, 
        o."User ID" AS user_id,
        CAST(regexp_replace("отрасли", '.*\[(\d+)\].*', '\1') AS INT) AS industry_id,
        CAST(regexp_replace("Уровень знаний в отрасли", '.*\[(\d+)\].*', '\1') AS INT) AS industry_knowledge_id,
        CASE 
            WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
        END AS date, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."опыт_сотрудника_в_отраслях" o
    JOIN dds_data."employees" s
    ON s.id = o."User ID"
    WHERE "Уровень знаний в отрасли" <> '' AND "дата" <> '' 
    AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_industry_experience")
)
INSERT INTO dds_data."employee_industry_experience" 
SELECT 
    id, 
    user_id, 
    industry_id, 
    industry_knowledge_id, 
    date, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    industry_id = EXCLUDED.industry_id,
    industry_knowledge_id = EXCLUDED.industry_knowledge_id,
    date = EXCLUDED.date,
    last_update = EXCLUDED.last_update;

-- таблица опыта "employee_subject_experience"
WITH new_data AS (
    SELECT 
        o.id, 
        o."User ID" AS user_id,
        CAST(regexp_replace("Предментые области", '.*\[(\d+)\].*', '\1') AS INT) AS subject_id,
        CAST(regexp_replace("Уровень знаний в предметной облас", '.*\[(\d+)\].*', '\1') AS INT) AS subject_knowledge_id,
        CASE 
            WHEN TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("дата", 'DD-MM-YYYY HH24:MI:SS')
        END AS date, 
        CASE 
            WHEN TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > NOW() THEN NOW()
            ELSE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
        END AS last_update
    FROM ods_data."опыт_сотрудника_в_предметных_обла" o
    JOIN dds_data."employees" s
    ON s.id = o."User ID"
    WHERE "Уровень знаний в предметной облас" <> '' AND "дата" <> '' 
    AND TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_subject_experience")
)
INSERT INTO dds_data."employee_subject_experience" 
SELECT 
    id, 
    user_id, 
    subject_id, 
    subject_knowledge_id, 
    date, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    subject_id = EXCLUDED.subject_id,
    subject_knowledge_id = EXCLUDED.subject_knowledge_id,
    date = EXCLUDED.date,
    last_update = EXCLUDED.last_update;

-- обновление данных в таблицах образования сотрудников

-- таблица образования "employee_education"
WITH new_data AS (
    SELECT 
        o.id, 
        o."User ID" AS user_id,
        CASE 
            WHEN "Уровень образование" LIKE 'Высшее образование%' THEN 175357
            WHEN "Уровень образование" LIKE '%Бакалавр%' THEN 76387
            WHEN "Уровень образование" LIKE 'Неполное%' THEN 177801
            WHEN "Уровень образование" LIKE 'Профессиональная подго%' THEN 177807
            WHEN "Уровень образование" LIKE '-%' THEN 148161
            ELSE CAST(regexp_replace("Уровень образование", '.*\[(\d+)\].*', '\1') AS INT)
        END AS education_level_id,
        "Название учебного заведения" AS institution,
        CASE WHEN "специальность" = '' THEN 'Не указано' ELSE специальность END AS specialty,
        CASE 
            WHEN "Год окончания" IS NULL THEN 0 
            WHEN "Год окончания"=2201 THEN 2021 
            ELSE "Год окончания" 
        END AS grad_year,
        TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') AS last_update
    FROM ods_data."образование_пользователей" o
    JOIN dds_data."employees" s
    ON s.id = o."User ID"
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_education")
)
INSERT INTO dds_data."employee_education" 
SELECT 
    id, 
    user_id, 
    education_level_id, 
    institution, 
    specialty, 
    grad_year, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    education_level_id = EXCLUDED.education_level_id,
    institution = EXCLUDED.institution,
    specialty = EXCLUDED.specialty,
    grad_year = EXCLUDED.grad_year,
    last_update = EXCLUDED.last_update;

-- таблица сертификатов "employee_certificates"
WITH new_data AS (
    SELECT 
        o.id, 
        o."User ID" AS user_id,
        "Наименование сертификата" AS certificate_name,
        CASE 
            WHEN "Организация, выдавшая сертификат" = '' THEN 'Не указано' 
            ELSE "Организация, выдавшая сертификат" 
        END AS issuer,
        "Год сертификата" AS certification_year,
        TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') AS last_update
    FROM ods_data."сертификаты_пользователей" o
    JOIN dds_data."employees" s
    ON s.id = o."User ID"
    WHERE TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') > (SELECT MAX(last_update) FROM dds_data."employee_certificates")
)
INSERT INTO dds_data."employee_certificates" 
SELECT 
    id, 
    user_id, 
    certificate_name, 
    issuer, 
    certification_year, 
    last_update
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    user_id = EXCLUDED.user_id,
    certificate_name = EXCLUDED.certificate_name,
    issuer= EXCLUDED.issuer,
    certification_year = EXCLUDED.certification_year,
    last_update = EXCLUDED.last_update;

-- обновление данных в резюме
-- отсутсвует дата изменения
INSERT INTO dds_data."resumes" 
SELECT r."ResumeID" as resume_id ,
    r."UserID" as user_id
FROM ods_data."резюмедар" r
JOIN dds_data."employees" s
ON s.id = r."UserID"
ON CONFLICT (resume_id) DO UPDATE SET
    user_id = EXCLUDED.user_id;














