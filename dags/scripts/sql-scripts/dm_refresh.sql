-- обновление данных в справочных таблицах DM слоя

-- таблица dm_data.skill_types
-- требует ручного обновления при добавлении новых таблиц с типами навыков

-- таблица dm_data.skill_levels
WITH new_data AS (
    SELECT 
        id, 
        name as level,
        CASE
            WHEN name = 'Использовал на проекте' THEN 1
            WHEN name = 'Novice' THEN 2
            WHEN name = 'Junior' THEN 3
            WHEN name = 'Middle' THEN 4
            WHEN name = 'Senior' THEN 5
            WHEN name = 'Expert' THEN 6
        END AS level_num,
        current_date AS last_update
    FROM dds_data.d_knowledge_levels
    WHERE last_update > (SELECT MAX(last_update) FROM dm_data.skill_levels)
)
INSERT INTO dm_data.skill_levels 
SELECT id, level, level_num, last_update
FROM new_data
ON CONFLICT (id) DO UPDATE
SET 
    level = EXCLUDED.level,
    level_num = EXCLUDED.level_num,
    last_update = EXCLUDED.last_update
WHERE dm_data.skill_levels.last_update < EXCLUDED.last_update;


-- таблица dm_data.skills
WITH new_data AS (
    SELECT id, name, last_update FROM dds_data.d_databases
    WHERE name <> 'Другое' AND last_update > (SELECT MAX(last_update) FROM dm_data.skills)
    UNION ALL
    SELECT id, name, last_update FROM dds_data.d_tools
    WHERE name <> 'Другое' AND last_update > (SELECT MAX(last_update) FROM dm_data.skills)
    UNION ALL
    SELECT id, name, last_update FROM dds_data.d_platforms
    WHERE name <> 'Другое' AND last_update > (SELECT MAX(last_update) FROM dm_data.skills)
    UNION ALL
    SELECT id, name, last_update FROM dds_data.d_ide
    WHERE name <> 'Другое' AND last_update > (SELECT MAX(last_update) FROM dm_data.skills)
    UNION ALL
    SELECT id, name, last_update FROM dds_data.d_subjects
    WHERE name <> 'Другое' AND last_update > (SELECT MAX(last_update) FROM dm_data.skills)
    UNION ALL
    SELECT id, name, last_update FROM dds_data.d_technologies
    WHERE name <> 'Другое' AND last_update > (SELECT MAX(last_update) FROM dm_data.skills)
    UNION ALL
    SELECT id, name, last_update FROM dds_data.d_frameworks
    WHERE name <> 'Другое' AND last_update > (SELECT MAX(last_update) FROM dm_data.skills)
    UNION ALL
    SELECT id, name, last_update FROM dds_data.d_programming_languages
    WHERE name <> 'Другое' AND last_update > (SELECT MAX(last_update) FROM dm_data.skills)

)
INSERT INTO dm_data.skills 
SELECT 
    id, 
    name as skill, 
	current_date
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    skill = EXCLUDED.skill,
    last_update = EXCLUDED.last_update;

-- таблица dm_data.departments
INSERT INTO dm_data.departments (department, last_update)
SELECT DISTINCT department, CURRENT_DATE
FROM dds_data.employees
ON CONFLICT (department) DO NOTHING;

-- таблица dm_data.job_titles
INSERT INTO dm_data.job_titles (job_title, last_update)
SELECT DISTINCT job_title, CURRENT_DATE
FROM dds_data.employees
ON CONFLICT (job_title) DO NOTHING;

-- таблица dm_data.employees
WITH new_data AS (
    SELECT id, activity, last_auth, last_update
    FROM dds_data.employees
    WHERE last_update > (SELECT MAX(last_update) FROM dm_data.employees)

)
INSERT INTO dm_data.employees 
SELECT 
    id, 
    'Иван' as first_name,
    'Иванов' as last_name,
    activity, 
    last_auth, 
    current_date
FROM new_data
ON CONFLICT (id) DO UPDATE SET
    activity = EXCLUDED.activity,
    last_auth = EXCLUDED.last_auth,
    last_update = EXCLUDED.last_update;

-- таблица resume и связные таблицы

DO $$
DECLARE
    max_skill_data_update_date TIMESTAMP;
    max_resume_update_date TIMESTAMP;
BEGIN
    -- Получение максимальной даты изменения из таблиц навыков
    WITH skill_data_dates AS (
        SELECT MAX(last_update) AS max_update_date
        FROM (
            SELECT last_update FROM dds_data.employee_db_skills
            UNION ALL
            SELECT last_update FROM dds_data.employee_tool_skills
            UNION ALL
            SELECT last_update FROM dds_data.employee_platform_skills
            UNION ALL
            SELECT last_update FROM dds_data.employee_ide_skills
            UNION ALL
            SELECT last_update FROM dds_data.employee_system_skills
            UNION ALL
            SELECT last_update FROM dds_data.employee_tech_skills
            UNION ALL
            SELECT last_update FROM dds_data.employee_framework_skills
            UNION ALL
            SELECT last_update FROM dds_data.employee_programming_skills
        ) AS all_dates
    )
    SELECT MAX(max_update_date) INTO max_skill_data_update_date
    FROM skill_data_dates;

    -- max дата изменения из таблицы resume
    SELECT MAX(last_update) INTO max_resume_update_date
    FROM dm_data.resume;


    IF max_skill_data_update_date > max_resume_update_date THEN
        -- очистка таблиц
        TRUNCATE TABLE dm_data.resume;
        TRUNCATE TABLE dm_data.depart_key_skills;
        TRUNCATE TABLE dm_data.job_key_skills;
        TRUNCATE TABLE dm_data.job_key_skill_types;
        TRUNCATE TABLE dm_data.depart_key_skill_types;
        TRUNCATE TABLE dm_data.job_key_skill_type_skills;

        -- вставка новых данных в таблицу resume
        WITH skill_data AS (
            SELECT 
                user_id, 
                j.id AS job_title_id, 
                d.id AS department_id, 
                1 AS skill_type_id, 
                db_id AS skill_id, 
                knowledge_id AS skill_level_id, 
                date
            FROM dds_data.employee_db_skills s
            JOIN dds_data.employees e ON e.id = s.user_id
            JOIN dm_data.departments d ON d.department = e.department
            JOIN dm_data.job_titles j ON j.job_title = e.job_title
            UNION ALL
            SELECT 
                user_id, 
                j.id AS job_title_id, 
                d.id AS department_id, 
                2 AS skill_type_id, 
                tool_id AS skill_id, 
                knowledge_id AS skill_level_id, 
                date
            FROM dds_data.employee_tool_skills s
            JOIN dds_data.employees e ON e.id = s.user_id
            JOIN dm_data.departments d ON d.department = e.department
            JOIN dm_data.job_titles j ON j.job_title = e.job_title
            UNION ALL
            SELECT 
                user_id, 
                j.id AS job_title_id, 
                d.id AS department_id, 
                3 AS skill_type_id, 
                platform_id AS skill_id, 
                knowledge_id AS skill_level_id, 
                date
            FROM dds_data.employee_platform_skills s
            JOIN dds_data.employees e ON e.id = s.user_id
            JOIN dm_data.departments d ON d.department = e.department
            JOIN dm_data.job_titles j ON j.job_title = e.job_title
            UNION ALL
            SELECT 
                user_id, 
                j.id AS job_title_id, 
                d.id AS department_id, 
                4 AS skill_type_id, 
                ide_id AS skill_id, 
                knowledge_id AS skill_level_id, 
                date
            FROM dds_data.employee_ide_skills s
            JOIN dds_data.employees e ON e.id = s.user_id
            JOIN dm_data.departments d ON d.department = e.department
            JOIN dm_data.job_titles j ON j.job_title = e.job_title
            UNION ALL
            SELECT 
                user_id, 
                j.id AS job_title_id, 
                d.id AS department_id, 
                5 AS skill_type_id, 
                system_id AS skill_id, 
                knowledge_id AS skill_level_id, 
                date
            FROM dds_data.employee_system_skills s
            JOIN dds_data.employees e ON e.id = s.user_id
            JOIN dm_data.departments d ON d.department = e.department
            JOIN dm_data.job_titles j ON j.job_title = e.job_title
            UNION ALL
            SELECT 
                user_id, 
                j.id AS job_title_id, 
                d.id AS department_id, 
                6 AS skill_type_id, 
                tech_id AS skill_id, 
                knowledge_id AS skill_level_id, 
                date
            FROM dds_data.employee_tech_skills s
            JOIN dds_data.employees e ON e.id = s.user_id
            JOIN dm_data.departments d ON d.department = e.department
            JOIN dm_data.job_titles j ON j.job_title = e.job_title
            UNION ALL
            SELECT 
                user_id, 
                j.id AS job_title_id, 
                d.id AS department_id, 
                7 AS skill_type_id, 
                framework_id AS skill_id, 
                knowledge_id AS skill_level_id, 
                date
            FROM dds_data.employee_framework_skills s
            JOIN dds_data.employees e ON e.id = s.user_id
            JOIN dm_data.departments d ON d.department = e.department
            JOIN dm_data.job_titles j ON j.job_title = e.job_title
            UNION ALL
            SELECT 
                user_id, 
                j.id AS job_title_id, 
                d.id AS department_id, 
                8 AS skill_type_id, 
                programming_id AS skill_id, 
                knowledge_id AS skill_level_id, 
                date
            FROM dds_data.employee_programming_skills s
            JOIN dds_data.employees e ON e.id = s.user_id
            JOIN dm_data.departments d ON d.department = e.department
            JOIN dm_data.job_titles j ON j.job_title = e.job_title
        )

        INSERT INTO dm_data.resume(user_id, job_title_id, department_id, skill_type_id, skill_id, skill_level_id, skill_status, date, last_update)
        SELECT 
            user_id, 
            job_title_id, 
            department_id, 
            skill_type_id, 
            skill_id, 
            skill_level_id, 
            CASE WHEN rn = 1 THEN 'new' ELSE 'up' END AS skill_status, 
            date, 
            current_date AS last_update
        FROM (
            SELECT 
                user_id, 
                job_title_id, 
                department_id, 
                skill_type_id, 
                skill_id, 
                skill_level_id, 
                date, 
                ROW_NUMBER() OVER (PARTITION BY user_id, skill_id ORDER BY date) AS rn
            FROM skill_data
        ) a;

        -- ключевые навыки по подразделению 
        WITH rn_skills AS (
            SELECT *, row_number() over(partition by department_id order by cnt desc ) rn
            FROM (
                SELECT distinct department_id, skill_type_id, skill_id, count(*) over (partition by department_id, skill_type_id, skill_id) cnt
                FROM dm_data.resume
            ) cnt_skills
        )
        INSERT INTO dm_data.depart_key_skills
        SELECT department_id, skill_type_id, skill_id
        FROM rn_skills
        WHERE rn<11
        ORDER BY department_id;

        -- ключевые навыки по должности
        WITH rn_skills AS (
            SELECT *, row_number() over(partition by job_title_id order by cnt desc ) rn
            FROM (
                SELECT distinct job_title_id, skill_type_id, skill_id, count(*) over (partition by job_title_id, skill_type_id, skill_id) cnt
                FROM dm_data.resume
            ) cnt_skills
        )
        INSERT INTO dm_data.job_key_skills
        SELECT job_title_id, skill_type_id, skill_id
        FROM rn_skills
        WHERE rn<11
        ORDER BY job_title_id;

        -- ключевые типы навыков по должности
        WITH rn_skills AS (
            SELECT *, row_number() over(partition by job_title_id order by cnt desc ) rn
            FROM (
                SELECT distinct job_title_id, skill_type_id, count(*) over (partition by job_title_id, skill_type_id) cnt
                FROM dm_data.resume
            ) cnt_skills
        )
        INSERT INTO dm_data.job_key_skill_types
        SELECT job_title_id, skill_type_id
        FROM rn_skills
        WHERE rn<5
        ORDER BY job_title_id;

        -- ключевые типы навыков по подразделению
        WITH rn_skills AS (
            SELECT *, row_number() over(partition by department_id order by cnt desc ) rn
            FROM (
                SELECT distinct department_id, skill_type_id, count(*) over (partition by department_id, skill_type_id) cnt
                FROM dm_data.resume
            ) cnt_skills
        )
        INSERT INTO dm_data.depart_key_skill_types
        SELECT department_id, skill_type_id
        FROM rn_skills
        WHERE rn<5
        ORDER BY department_id;

        -- ключевые навыки в типах навыков в должности
        WITH cnt_skills AS (
            SELECT distinct job_title_id, skill_type_id, skill_id, count(*) over (partition by job_title_id, skill_type_id, skill_id) as cnt
            FROM dm_data.resume
        ),
        rn_skills AS (
            SELECT *, row_number() over (partition by job_title_id, skill_type_id order by cnt desc) as rn
            FROM cnt_skills
        )
        INSERT INTO dm_data.job_key_skill_type_skills
        SELECT job_title_id, skill_type_id, skill_id
        FROM rn_skills
        WHERE rn < 6 
        ORDER BY job_title_id, skill_type_id;

        -- обновление таблицы резюме ПОСЛЕ перерасчета ключевых навыков.
        WITH key_flags AS (
            SELECT 
                r.user_id,
                r.job_title_id,
                r.department_id,
                r.skill_type_id,
                r.skill_id,
                CASE WHEN dks.skill_id IS NULL THEN FALSE ELSE TRUE END AS is_depart_key_skills,
                CASE WHEN jks.skill_id IS NULL THEN FALSE ELSE TRUE END AS is_job_key_skills,
                CASE WHEN dkt.skill_type_id IS NULL THEN FALSE ELSE TRUE END AS is_depart_key_skill_type,
                CASE WHEN jkt.skill_type_id IS NULL THEN FALSE ELSE TRUE END AS is_job_key_skill_type,
                CASE WHEN jkts.skill_id IS NULL THEN FALSE ELSE TRUE END AS is_job_key_skill_type_skill
            FROM dm_data.resume r
            LEFT JOIN dm_data.depart_key_skills dks
                ON dks.department_id = r.department_id 
                AND dks.skill_type_id = r.skill_type_id 
                AND dks.skill_id = r.skill_id
            LEFT JOIN dm_data.job_key_skills jks
                ON jks.job_title_id = r.job_title_id 
                AND jks.skill_type_id = r.skill_type_id 
                AND jks.skill_id = r.skill_id
            LEFT JOIN dm_data.depart_key_skill_types dkt
                ON dkt.department_id = r.department_id 
                AND dkt.skill_type_id = r.skill_type_id
            LEFT JOIN dm_data.job_key_skill_types jkt
                ON jkt.job_title_id = r.job_title_id 
                AND jkt.skill_type_id = r.skill_type_id
            LEFT JOIN dm_data.job_key_skill_type_skills jkts
                ON jkts.job_title_id = r.job_title_id 
                AND jkts.skill_type_id = r.skill_type_id 
                AND jkts.skill_id = r.skill_id
        )
        UPDATE dm_data.resume r
        SET 
            is_depart_key_skill = kf.is_depart_key_skills,
            is_job_key_skill = kf.is_job_key_skills,
            is_depart_key_skill_type = kf.is_depart_key_skill_type,
            is_job_key_skill_type = kf.is_job_key_skill_type,
            is_job_key_skill_type_skill = kf.is_job_key_skill_type_skill
        FROM key_flags kf
        WHERE 
            r.user_id = kf.user_id
            AND r.job_title_id = kf.job_title_id
            AND r.department_id = kf.department_id
            AND r.skill_type_id = kf.skill_type_id
            AND r.skill_id = kf.skill_id;
    END IF;
END $$;





