--
-- Вставка данных в справочные материалы
--


-- в таблице баз данных есть неверный год, проверить
INSERT INTO dds_data.d_databases  
SELECT id, 
    "название", 
    TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS')
FROM ods_data."базы_данных"


INSERT INTO dds_data.d_frameworks
SELECT id, 
	"название", 
	TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') 
FROM ods_data."фреймворки"


INSERT INTO dds_data.d_frameworks
SELECT id, 
	"название", 
	TO_TIMESTAMP("Дата изм.", 'DD-MM-YYYY HH24:MI:SS') 
FROM ods_data."фреймворки"




