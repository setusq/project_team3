
import subprocess
import os
from airflow.providers.postgres.hooks.postgres import PostgresHook

def dump_schema_and_dataa(source_db, schema, user, host, dump_file, password):
    try:
        dump_cmd = [
            'pg_dump',
            '-U', user,
            '-h', host,
            '-n', schema,
            '-f', dump_file,
            source_db
        ]
        
        env = os.environ.copy()
        env['PGPASSWORD'] = password
        

        subprocess.run(dump_cmd, check=True, env=env)
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
            '-f', dump_file
        ]
        
        os.environ['PGPASSWORD'] = password
        
        subprocess.run(restore_cmd, check=True)
        print(f"Схема и данные из файла {dump_file} успешно импортированы в базу данных {target_db}.")
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при импорте схемы и данных: {e}")
        

def get_connection_params(conn_id, **kwargs):
    hook = PostgresHook(postgres_conn_id=conn_id)
    connection = hook.get_conn()
    params = {
        'user': connection.info.user,
        'password': connection.info.password,
        'host': connection.info.host,
        'port': connection.info.port,
        'database': connection.info.dbname,
    }
    kwargs['ti'].xcom_push(key=conn_id, value=params)
