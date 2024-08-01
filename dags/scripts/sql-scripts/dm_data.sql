-- сотрудники с ФИО

WITH name_pairs AS (
    SELECT
        first_name,
        last_name,
        ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
    FROM (
        VALUES
        ('Алексей', 'Иванов'), ('Дмитрий', 'Смирнов'), ('Сергей', 'Кузнецов'), ('Андрей', 'Попов'), ('Александр', 'Лебедев'), 
        ('Владимир', 'Козлов'), ('Евгений', 'Новиков'), ('Николай', 'Морозов'), ('Иван', 'Петров'), ('Анатолий', 'Волков'), 
        ('Виктор', 'Соловьёв'), ('Максим', 'Васильев'), ('Юрий', 'Зайцев'), ('Павел', 'Павлов'), ('Константин', 'Соколов'), 
        ('Артем', 'Михайлов'), ('Олег', 'Фёдоров'), ('Георгий', 'Орлов'), ('Леонид', 'Белоусов'), ('Григорий', 'Сидоров'),
        ('Роман', 'Матвеев'), ('Борис', 'Тихонов'), ('Анатолий', 'Сорокин'), ('Геннадий', 'Семенов'), ('Виталий', 'Руднев'),
        ('Станислав', 'Игнатьев'), ('Василий', 'Савельев'), ('Владислав', 'Мельников'), ('Александр', 'Андреев'), ('Егор', 'Логинов'),
        ('Антон', 'Кириллов'), ('Игорь', 'Шаповалов'), ('Михаил', 'Фролов'), ('Денис', 'Панин'), ('Юрий', 'Борисов'),
        ('Виктор', 'Яковлев'), ('Артём', 'Белов'), ('Евгений', 'Воронов'), ('Пётр', 'Мартынов'), ('Александр', 'Калашников'),
        ('Андрей', 'Миронов'), ('Илья', 'Фомин'), ('Алексей', 'Горбунов'), ('Анатолий', 'Ефимов'), ('Роман', 'Дмитриев'),
        ('Владимир', 'Тихонов'), ('Сергей', 'Корнилов'), ('Иван', 'Алексеев'), ('Григорий', 'Гришин'), ('Егор', 'Коновалов'),
        ('Александр', 'Громов'), ('Дмитрий', 'Глухов'), ('Сергей', 'Макаров'), ('Андрей', 'Кожевников'), ('Максим', 'Широков'),
        ('Константин', 'Сазонов'), ('Владислав', 'Романов'), ('Николай', 'Грачёв'), ('Виктор', 'Шубин'), ('Михаил', 'Лихачёв'),
        ('Василий', 'Колесников'), ('Артём', 'Лапин'), ('Иван', 'Панкратов'), ('Анатолий', 'Карпов'), ('Евгений', 'Селиванов'),
        ('Юрий', 'Горячев'), ('Павел', 'Козлов'), ('Сергей', 'Зотов'), ('Александр', 'Киселёв'), ('Роман', 'Ершов'),
        ('Илья', 'Рубцов'), ('Дмитрий', 'Бондаренко'), ('Андрей', 'Сысоев'), ('Виктор', 'Федосеев'), ('Михаил', 'Копылов'),
        ('Артем', 'Дроздов'), ('Владимир', 'Беспалов'), ('Константин', 'Гуляев'), ('Иван', 'Шаров'), ('Евгений', 'Крылов'),
        ('Александр', 'Буров'), ('Максим', 'Гришин'), ('Николай', 'Одинцов'), ('Сергей', 'Ларин'), ('Юрий', 'Крюков'),
        ('Владислав', 'Гордеев'), ('Анатолий', 'Герасимов'), ('Павел', 'Мясников'), ('Георгий', 'Третьяков'), ('Андрей', 'Черкасов'),
        ('Алексей', 'Котов'), ('Евгений', 'Бойцов'), ('Николай', 'Панкратов'), ('Михаил', 'Титов'), ('Владимир', 'Поляков'),
        ('Иван', 'Герасимов'), ('Сергей', 'Прохоров'), ('Василий', 'Малышев'), ('Юрий', 'Пастухов'), ('Григорий', 'Блохин'),
        ('Роман', 'Ковалев'), ('Дмитрий', 'Логинов'), ('Алексей', 'Блинов'), ('Илья', 'Колесников'), ('Андрей', 'Захаров'),
        ('Павел', 'Сергеев'), ('Анатолий', 'Миронов'), ('Евгений', 'Егоров'), ('Александр', 'Митрофанов'), ('Максим', 'Мясников'),
        ('Сергей', 'Зубов'), ('Иван', 'Галкин'), ('Дмитрий', 'Ершов'), ('Владимир', 'Бородин'), ('Николай', 'Мальцев'),
        ('Юрий', 'Михеев'), ('Артем', 'Фетисов'), ('Константин', 'Анисимов'), ('Василий', 'Елисеев'), ('Георгий', 'Терентьев'),
        ('Алексей', 'Фролов'), ('Денис', 'Литвинов'), ('Виктор', 'Павлов'), ('Роман', 'Буров'), ('Михаил', 'Соболев'),
        ('Иван', 'Ларионов'), ('Артём', 'Бабушкин'), ('Павел', 'Емельянов'), ('Григорий', 'Третьяков'), ('Александр', 'Капустин'),
        ('Юрий', 'Орлов'), ('Евгений', 'Горшков'), ('Иван', 'Тарасов'), ('Анатолий', 'Крылов'), ('Максим', 'Гусев'),
        ('Дмитрий', 'Широков'), ('Василий', 'Медведев'), ('Роман', 'Фомин'), ('Николай', 'Воронцов'), ('Константин', 'Соболев'),
        ('Павел', 'Тихонов'), ('Андрей', 'Фомичёв'), ('Алексей', 'Якунин'), ('Юрий', 'Зайцев'), ('Иван', 'Морозов'),
        ('Сергей', 'Шаров'), ('Анатолий', 'Мартынов'), ('Евгений', 'Титов'), ('Виктор', 'Афанасьев'), ('Георгий', 'Щукин'),
        ('Александр', 'Соловьёв'), ('Денис', 'Гончаров'), ('Константин', 'Зиновьев'), ('Максим', 'Чумаков'), ('Павел', 'Николаев'),
        ('Владислав', 'Шевцов'), ('Артём', 'Сазонов'), ('Юрий', 'Климов'), ('Василий', 'Карпов'), ('Алексей', 'Воронков'),
        ('Михаил', 'Гусев'), ('Иван', 'Семенов'), ('Александр', 'Никитин'), ('Евгений', 'Виноградов'), ('Григорий', 'Дроздов'),
        ('Роман', 'Павлов'), ('Юрий', 'Николаев'), ('Дмитрий', 'Миронов'), ('Владислав', 'Леонов'), ('Алексей', 'Мальцев'),
        ('Виктор', 'Кононов'), ('Артём', 'Тимофеев'), ('Павел', 'Фролов'), ('Георгий', 'Власов'), ('Максим', 'Кузьмин'),
        ('Владимир', 'Кудрявцев'), ('Анатолий', 'Овчинников'), ('Константин', 'Герасимов'), ('Иван', 'Романов'), ('Сергей', 'Лебедев'),
        ('Николай', 'Егоров'), ('Андрей', 'Титов'), ('Юрий', 'Гаврилов'), ('Василий', 'Широков'), ('Дмитрий', 'Демидов'),
        ('Михаил', 'Калинин'), ('Роман', 'Курочкин'), ('Алексей', 'Фетисов'), ('Виктор', 'Субботин'), ('Григорий', 'Никифоров'),
        ('Евгений', 'Тихонов'), ('Иван', 'Захаров'), ('Константин', 'Куликов'), ('Максим', 'Блинов'), ('Артём', 'Климов'),
        ('Николай', 'Корнилов'), ('Александр', 'Чумаков'), ('Сергей', 'Сысоев'), ('Юрий', 'Павлов'), ('Анатолий', 'Кожевников'),
        ('Алексей', 'Дмитриев'), ('Владислав', 'Фомин'), ('Евгений', 'Зиновьев'), ('Иван', 'Соловьёв'), ('Роман', 'Маслов'),
        ('Григорий', 'Шестаков'), ('Артем', 'Герасимов'), ('Дмитрий', 'Елисеев'), ('Александр', 'Котов'), ('Максим', 'Кононов'),
        ('Николай', 'Лебедев'), ('Алексей', 'Гусев'), ('Сергей', 'Щербаков'), ('Юрий', 'Матвеев'), ('Иван', 'Шестаков'),
        ('Павел', 'Куликов'), ('Андрей', 'Белоусов'), ('Денис', 'Тарасов'), ('Виктор', 'Егоров'), ('Анатолий', 'Власов'),
        ('Анна', 'Иванова'), ('Мария', 'Смирнова'), ('Екатерина', 'Кузнецова'), ('Алина', 'Попова'), ('Юлия', 'Лебедева'),
        ('Светлана', 'Козлова'), ('Ольга', 'Новикова'), ('Елена', 'Морозова'), ('Татьяна', 'Петрова'), ('Дарья', 'Волкова'),
        ('Ирина', 'Соловьёва'), ('Виктория', 'Васильева'), ('Анастасия', 'Зайцева'), ('Наталья', 'Павлова'), ('Вероника', 'Соколова'),
        ('Маргарита', 'Михайлова'), ('Надежда', 'Фёдорова'), ('Алёна', 'Орлова'), ('Оксана', 'Белоусова'), ('Лариса', 'Сидорова'),
        ('Евгения', 'Матвеева'), ('Полина', 'Тихонова'), ('Валентина', 'Сорокина'), ('Людмила', 'Семенова'), ('Елизавета', 'Руднева'),
        ('Ксения', 'Игнатьева'), ('Мила', 'Савельева'), ('София', 'Мельникова'), ('Алиса', 'Андреева'), ('Зоя', 'Логинова'),
        ('Варвара', 'Кириллова'), ('Александра', 'Шаповалова'), ('Галина', 'Фролова'), ('Марина', 'Панина'), ('Таисия', 'Борисова'),
        ('Юлиана', 'Яковлева'), ('Жанна', 'Белова'), ('Любовь', 'Воронова'), ('Ольга', 'Мартынова'), ('Тамара', 'Калашникова'),
        ('Раиса', 'Миронова'), ('Нина', 'Фомина'), ('Елена', 'Горбунова'), ('Инна', 'Ефимова'), ('Аделина', 'Дмитриева'),
        ('Лидия', 'Тихонова'), ('Наталия', 'Корнилова'), ('Вера', 'Алексеева'), ('Эльвира', 'Гришина'), ('Снежана', 'Коновалова'),
        ('Виктория', 'Громова'), ('Яна', 'Глухова'), ('Алиса', 'Макарова'), ('Анастасия', 'Кожевникова'), ('Дарья', 'Широкова'),
        ('Екатерина', 'Сазонова'), ('Людмила', 'Романова'), ('Наталья', 'Грачёва'), ('Кристина', 'Шубина'), ('Софья', 'Лихачёва'),
        ('Ольга', 'Колесникова'), ('Алина', 'Лапина'), ('Ирина', 'Панкратова'), ('Юлия', 'Карпова'), ('Анна', 'Селиванова'),
        ('Мария', 'Горячева'), ('Светлана', 'Козлова'), ('Елена', 'Зотова'), ('Татьяна', 'Киселёва'), ('Дарья', 'Ершова'),
        ('Полина', 'Рубцова'), ('Валерия', 'Бондаренко'), ('Маргарита', 'Сысоева'), ('Виктория', 'Федосеева'), ('Алиса', 'Копылова'),
        ('Евгения', 'Дроздова'), ('Ксения', 'Беспалова'), ('Наталья', 'Гуляева'), ('Анна', 'Шарова'), ('Елена', 'Крылова'),
        ('Александра', 'Бурова'), ('Мария', 'Гришина'), ('София', 'Одинцова'), ('Анна', 'Ларина'), ('Екатерина', 'Крюкова'),
        ('Людмила', 'Гордеева'), ('Ольга', 'Герасимова'), ('Татьяна', 'Мясникова'), ('Ирина', 'Третьякова'), ('Анастасия', 'Черкасова'),
        ('Анна', 'Котова'), ('Мария', 'Бойцова'), ('Екатерина', 'Панкратова'), ('Алина', 'Титова'), ('Юлия', 'Полякова'),
        ('Светлана', 'Герасимова'), ('Ольга', 'Прохорова'), ('Татьяна', 'Малышева'), ('Дарья', 'Пастухова'), ('Евгения', 'Блохина'),
        ('Полина', 'Ковалева'), ('Валерия', 'Логинова'), ('Маргарита', 'Блинова'), ('Виктория', 'Колесникова'), ('Алиса', 'Захарова'),
        ('Евгения', 'Сергеева'), ('Ксения', 'Миронова'), ('Анна', 'Егорова'), ('Екатерина', 'Митрофанова'), ('Софья', 'Мясникова'),
        ('Алексей', 'Терентьев'), ('Борис', 'Романенко'), ('Вадим', 'Барсуков'), ('Геннадий', 'Чернышев'), ('Дмитрий', 'Рыбаков'),
        ('Евгений', 'Григорьев'), ('Игорь', 'Яковлев'), ('Кирилл', 'Иванов'), ('Лев', 'Максимов'), ('Марк', 'Лавров'),
        ('Никита', 'Тимошин'), ('Олег', 'Калинин'), ('Павел', 'Майоров'), ('Роман', 'Куликов'), ('Семен', 'Потапов'),
        ('Тимур', 'Смирнов'), ('Ульян', 'Фролов'), ('Фёдор', 'Гусев'), ('Ярослав', 'Егоров'), ('Арсений', 'Анисимов'),
        ('Богдан', 'Федоров'), ('Виталий', 'Ларионов'), ('Глеб', 'Головин'), ('Данила', 'Капустин'), ('Егор', 'Дубровин'),
        ('Илья', 'Морозов'), ('Константин', 'Савельев'), ('Леонид', 'Павлов'), ('Михаил', 'Шаров'), ('Николай', 'Гришин'),
        ('Олег', 'Ильин'), ('Петр', 'Родионов'), ('Роман', 'Жуков'), ('Сергей', 'Фомин'), ('Тимофей', 'Фёдоров'),
        ('Устин', 'Коновалов'), ('Филипп', 'Соболев'), ('Ярослав', 'Ермолов'), ('Александр', 'Тимофеев'), ('Борис', 'Руднев'),
        ('Вадим', 'Ремезов'), ('Виктор', 'Белоусов'), ('Геннадий', 'Захаров'), ('Денис', 'Васильев'), ('Евгений', 'Матвеев'),
        ('Иван', 'Виноградов'), ('Кирилл', 'Кононов'), ('Лев', 'Калинин'), ('Максим', 'Зимин'), ('Никита', 'Лебедев'),
        ('Олег', 'Горбунов'), ('Павел', 'Левин'), ('Роман', 'Гаврилов'), ('Семен', 'Титов'), ('Тимур', 'Лукин'),
        ('Фёдор', 'Голубев'), ('Юрий', 'Панин'), ('Ярослав', 'Данилов'), ('Алексей', 'Чистяков'), ('Богдан', 'Гусев'),
        ('Виталий', 'Герасимов'), ('Владимир', 'Андреев'), ('Глеб', 'Ковалев'), ('Дмитрий', 'Глухов'), ('Евгений', 'Крылов'),
        ('Илья', 'Кудрявцев'), ('Константин', 'Голубев'), ('Леонид', 'Чистяков'), ('Максим', 'Тимошенко'), ('Николай', 'Миронов'),
        ('Олег', 'Селиванов'), ('Петр', 'Рыбаков'), ('Роман', 'Шумаков'), ('Сергей', 'Захаров'), ('Тимофей', 'Никитин'),
        ('Филипп', 'Морозов'), ('Юрий', 'Орлов'), ('Ярослав', 'Семенов'), ('Александр', 'Гусев'), ('Борис', 'Сорокин'),
        ('Вадим', 'Никифоров'), ('Виктор', 'Матвеев'), ('Геннадий', 'Коновалов'), ('Денис', 'Захаров'), ('Евгений', 'Денисов'),
        ('Иван', 'Рыбаков'), ('Кирилл', 'Беляев'), ('Лев', 'Тимофеев'), ('Максим', 'Щукин'), ('Никита', 'Тихонов'),
        ('Олег', 'Глушков'), ('Павел', 'Никитин'), ('Роман', 'Костин'), ('Семен', 'Лебедев'), ('Тимур', 'Васильев'),
        ('Фёдор', 'Воробьев'), ('Юрий', 'Макаров'), ('Ярослав', 'Савельев'), ('Алексей', 'Ермолов'), ('Богдан', 'Фомин'),
        ('Виталий', 'Романов'), ('Владимир', 'Шумаков'), ('Глеб', 'Семёнов'), ('Дмитрий', 'Киселев'), ('Евгений', 'Андреев'),
        ('Илья', 'Головин'), ('Константин', 'Кононов'), ('Леонид', 'Котов'), ('Михаил', 'Семенов'), ('Николай', 'Пахомов'),
        ('Олег', 'Петров'), ('Павел', 'Шаров'), ('Роман', 'Баранов'), ('Сергей', 'Давыдов'), ('Тимофей', 'Капустин'),
        ('Филипп', 'Романов'), ('Юрий', 'Кудрявцев'), ('Ярослав', 'Дмитриев'), ('Александр', 'Кулагин'), ('Борис', 'Фомин'),
        ('Вадим', 'Смирнов'), ('Виктор', 'Щукин'), ('Геннадий', 'Козлов'), ('Денис', 'Гусев'), ('Евгений', 'Тимофеев'),
        ('Илья', 'Шмидт'), ('Константин', 'Никитин'), ('Леонид', 'Старцев'), ('Максим', 'Тарасов'), ('Никита', 'Рябов'),
        ('Олег', 'Федоров'), ('Павел', 'Давыдов'), ('Роман', 'Кузнецов'), ('Семен', 'Ильин'), ('Тимур', 'Рогов'),
        ('Фёдор', 'Иванов'), ('Юрий', 'Шумаков'), ('Ярослав', 'Петров'), ('Алексей', 'Фролов'), ('Богдан', 'Захаров'),
        ('Виталий', 'Давыдов'), ('Владимир', 'Демидов'), ('Глеб', 'Галкин'), ('Дмитрий', 'Матвеев'), ('Евгений', 'Тихонов'),
        ('Илья', 'Ребров'), ('Константин', 'Курочкин'), ('Леонид', 'Смирнов'), ('Максим', 'Беспалов'), ('Никита', 'Леонов')
    ) AS a (first_name, last_name)
),
 emp_rn as (
	select *, row_number() over() as rn
	from dds_data.employees)


insert into dm_data.employees
select id, first_name, last_name, activity, last_auth, current_date as last_update
from emp_rn e join name_pairs n
on e.rn = n.rn
order by id;


-- справочные таблицы
INSERT INTO dm_data.skill_types (skill_type, last_update) VALUES
    ('базы данных', current_date),
    ('инструменты', current_date),
    ('платформы', current_date),
    ('среды разработки', current_date),
    ('системы', current_date),
    ('технологии', current_date),
    ('фреймворки', current_date),
    ('языки программирования', current_date);

-- подразделения
INSERT INTO dm_data.departments (department, last_update)
SELECT distinct department, current_date from dds_data.employees
order by department;

-- должности 
INSERT INTO dm_data.job_titles (job_title, last_update)
select distinct  job_title, current_date from dds_data.employees
order by job_title;


-- навыки 
insert into dm_data.skills
select id, name, current_date from dds_data.d_databases
	where name <> 'Другое' 
union all
select id, name, current_date from dds_data.d_tools
	where name <> 'Другое'
union all
select id, name, current_date from dds_data.d_platforms
	where name <> 'Другое' and name <> 'MS SQL Server' and name <> 'Oracle'
union all
select id, name, current_date from dds_data.d_ide
	where name <> 'Другое'
union all
select id, name, current_date from dds_data.d_system_types
	where name <> 'Другое'
union all
select id, name, current_date from dds_data.d_technologies
	where name <> 'Другое'
union all
select id, name, current_date from dds_data.d_frameworks
	where name <> 'Другое'
union all
select id, name, current_date from dds_data.d_programming_languages
where name <> 'Другое';

-- Уровни навыков
INSERT INTO dm_data.skill_levels
SELECT id, name,
    CASE
        WHEN name = 'Использовал на проекте' THEN 0
        WHEN name = 'Novice' THEN 1
        WHEN name = 'Junior' THEN 2
        WHEN name = 'Middle' THEN 3
        WHEN name = 'Senior' THEN 4
        WHEN name = 'Expert' THEN 5
    END,
    current_date
FROM dds_data.d_knowledge_levels;

-- resume
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
        case when platform_id = 239039 or platform_id = 115671 then 1 else 3 end AS skill_type_id, 
        case 
			when platform_id = 239039 then 115696 
			when platform_id = 115671 then 115699
			else platform_id
		end AS skill_id, 
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

insert into dm_data.resume(user_id, job_title_id, department_id, skill_type_id, skill_id, skill_level_id, skill_status, date, last_update)
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

with rn_skills as (
	select *, row_number() over(partition by department_id order by cnt desc ) rn from
(select distinct department_id, skill_type_id,  skill_id, count(*) over (partition by department_id, skill_type_id, skill_id) cnt from dm_data.resume) cnt_skills)

insert into dm_data.depart_key_skills
select department_id, skill_type_id, skill_id from
rn_skills
where rn<11
order by department_id;

-- ключевые навыки по должности
with rn_skills as (
	select *, row_number() over(partition by job_title_id order by cnt desc ) rn from
(select distinct job_title_id, skill_type_id,  skill_id, count(*) over (partition by job_title_id, skill_type_id, skill_id) cnt from dm_data.resume) cnt_skills)
insert into dm_data.job_key_skills
select job_title_id, skill_type_id, skill_id from
rn_skills
where rn<11
order by job_title_id;

-- ключевые типы навыков по должности
with rn_skills as (
	select *, row_number() over(partition by job_title_id order by cnt desc ) rn from
(select distinct job_title_id, skill_type_id, count(*) over (partition by job_title_id, skill_type_id) cnt from dm_data.resume) cnt_skills)
insert into dm_data.job_key_skill_types
select job_title_id, skill_type_id  from
rn_skills
where rn<5
order by job_title_id;

-- ключевые типы навыков по подразделению

with rn_skills as (
	select *, row_number() over(partition by department_id order by cnt desc ) rn from
(select distinct department_id, skill_type_id, count(*) over (partition by department_id, skill_type_id) cnt from dm_data.resume) cnt_skills)
insert into dm_data.depart_key_skill_types
select department_id, skill_type_id  from
rn_skills
where rn<5
order by department_id;

-- ключевые навыки в типах навыков в должности
with cnt_skills as 
(select distinct job_title_id, skill_type_id, skill_id, count(*) over (partition by job_title_id, skill_type_id, skill_id) as cnt from dm_data.resume),
rn_skills as 
(select *, row_number() over (partition by job_title_id, skill_type_id order by cnt desc) as rn from cnt_skills)

insert into dm_data.job_key_skill_type_skills
select job_title_id, skill_type_id, skill_id from rn_skills
where rn < 6 
order by job_title_id, skill_type_id;

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