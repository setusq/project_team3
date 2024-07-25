'''
Скрипт для инициализации сырого ODS слоя, являющийся полной копией source_data.

Функция `dump_schema_and_data` создает дамп файл (dump_file), содержащего данные и схему 
из указанной схемы (source_data) в исходной базе данных (source_db).

Функция `modify_schema_name` изменяет имя схемы в дамп файле с `source_data` на `ods_data`,
чтобы в целевой бд схема создалась уже с верным названием.

Функция `restore_schema_and_data` импортирует данные и схему из дамп файла в целевую базу данных.

'''

import subprocess
import os
import dotenv

def dump_schema_and_data(source_db, schema, user, host, dump_file, password):
    try:
        dump_cmd = [
            'pg_dump',
            '-U', user,
            '-h', host,
            '-n', schema,
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


def restore_schema_and_data(target_db, user, host, dump_file, password):
    try:
        restore_cmd = [
            'psql',
            '-U', user,
            '-h', host,
            '-d', target_db,
            '-f', dump_file,
        ]
        
        os.environ['PGPASSWORD'] = password
        
        subprocess.run(restore_cmd, check=True)
        print(f"Схема и данные из файла {dump_file} успешно импортированы в базу данных {target_db}.")
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при импорте схемы и данных: {e}")

if __name__ == "__main__":

    dotenv.load_dotenv()

    # парамтеры подключения к source_db

    source_db = os.getenv('SOURCE_DB')
    schema = os.getenv('SOURCE_SCHEMA')
    source_user = os.getenv('SOURCE_USER')
    source_host = os.getenv('SOURCE_HOST') 
    source_password = os.getenv('SOURCE_PASSWORD')   

    # параметры подключения к target_db

    target_db = os.getenv('TARGET_DB')
    target_user = os.getenv('TARGET_USER')
    target_host = os.getenv('TARGET_HOST')
    target_password = os.getenv('TARGET_PASSWORD') 

    dump_file = "dags/scripts/sql-scripts/ods_migration.sql"
    new_schema = "ods_data_test"

    dump_schema_and_data(source_db, schema, source_user, source_host, dump_file, source_password)
    
    modify_schema_name(dump_file, schema, new_schema)

    restore_schema_and_data(target_db, target_user, target_host, dump_file, target_password)
