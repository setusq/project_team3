'''
Скрипт для обновления данных в сыром ODS слое, являющийся полной копией данных из source_data.

Функция `dump_schema_and_data` создает дамп файл (dump_file), содержащий только данные 
из указанной схемы (source_data) в исходной базе данных (source_db).

Функция `clear_schema_data` очищает все данные в целевой схеме (ods_data) 
целевой базы данных (target_db) без удаления самих таблиц.

Функция `restore_schema_and_data` импортирует данные из дамп файла в целевую базу данных.

Параметры подключения к исходной и целевой базам данных, а также путь к дамп файлу, указаны в основной части скрипта.

Шаги:
1. Экспортируем данные из исходной базы данных.
2. Очищаем данные в целевой схеме целевой базы данных.
3. Импортируем данные из дамп файла в целевую базу данных.
'''

import subprocess
import os

def dump_schema_and_data(source_db, schema, user, host, dump_file, password):
    try:
        dump_cmd = [
            'pg_dump',
            '-U', user,
            '-h', host,
            '-n', schema,
            '--data-only',
            '-f', dump_file,
            source_db
        ]
        
        os.environ['PGPASSWORD'] = password
        
        subprocess.run(dump_cmd, check=True)
        print(f"Схема и данные схемы {schema} базы данных {source_db} успешно экспортированы в файл {dump_file}.")
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при экспорте схемы и данных: {e}")

def modify_schema_name(dump_file, old_schema, new_schema):
    try:
        with open(dump_file, 'r') as file:
            dump_data = file.read()
        
        dump_data = dump_data.replace(f'SCHEMA {old_schema}', f'SCHEMA {new_schema}')
        dump_data = dump_data.replace(f'SCHEMA "{old_schema}"', f'SCHEMA "{new_schema}"')
        dump_data = dump_data.replace(f'{old_schema}.', f'{new_schema}.')
        dump_data = dump_data.replace(f'"{old_schema}".', f'"{new_schema}".')
        
        with open(dump_file, 'w') as file:
            file.write(dump_data)
        
        print(f"Имя схемы успешно изменено с {old_schema} на {new_schema} в файле {dump_file}.")
    except Exception as e:
        print(f"Ошибка при изменении имени схемы: {e}")


def clear_schema_data(target_db, user, host, schema, password):
    try:
        clear_cmd = f"""
        DO $$ DECLARE
            r RECORD;
        BEGIN
            FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = '{schema}') LOOP
                EXECUTE 'TRUNCATE TABLE {schema}.' || quote_ident(r.tablename) || ' CASCADE';
            END LOOP;
        END $$;
        """
        psql_clear_cmd = [
            'psql',
            '-U', user,
            '-h', host,
            '-d', target_db,
            '-c', clear_cmd
        ]
        os.environ['PGPASSWORD'] = password
        subprocess.run(psql_clear_cmd, check=True)
        print(f"Данные схемы {schema} в базе данных {target_db} успешно очищены.")
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при очистке данных схемы: {e}")

def restore_schema_and_data(target_db, user, host, dump_file, password):
    try:
        restore_cmd = [
            'psql',
            '-U', user,
            '-h', host,
            '-d', target_db,
            '-f', dump_file
        ]
        
        os.environ['PGPASSWORD'] = password
        
        subprocess.run(restore_cmd, check=True)
        print(f"Схема и данные из файла {dump_file} успешно импортированы в базу данных {target_db}.")
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при импорте схемы и данных: {e}")

if __name__ == "__main__":
    # Параметры подключения к source_db
    source_db = "mila"
    schema = "source_data"
    source_user = "postgres"
    source_host = "localhost"
    source_password = "123"

    # Параметры подключения к target_db
    target_db = "mila"
    target_user = "postgres"
    target_host = "localhost"
    target_password = "123"

    dump_file = "scripts/sql-scripts/ods_migration.sql"
    new_schema = "ods_data"

    dump_schema_and_data(source_db, schema, source_user, source_host, dump_file, source_password)

    modify_schema_name(dump_file, schema, new_schema)

    clear_schema_data(target_db, target_user, target_host, new_schema, target_password)
    
    restore_schema_and_data(target_db, target_user, target_host, dump_file, target_password)
