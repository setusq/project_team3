'''
Cкрипт выполняет инициализацию слоя данных (DDS) в целевой базе данных.
Он загружает и выполняет DDL скрипт, который создает схему и таблицы, необходимые для работы с данными в DDS слое.
После чего загружает и выполняет DML скрипт для заполнения DDS слоя данными.
'''

import subprocess
import os

def execute_ddl_script(target_db, user, host, port, ddl_file, password):
    try:

        if not os.path.isfile(ddl_file):
            print(f"Файл {ddl_file} не найден.")
            return

        execute_cmd = [
            'psql',
            '-U', user,
            '-h', host,
            '-d', target_db,
            '-f', ddl_file,
            '-p', port
        ]
        
        os.environ['PGPASSWORD'] = password
        
        subprocess.run(execute_cmd, check=True)
        print(f"DDL скрипт из файла {ddl_file} успешно выполнен в базе данных {target_db}.")
    except subprocess.CalledProcessError as e:
        print(f"Произошла ошибка при выполнении DDL скрипта: {e}")

def execute_dml_script(target_db, user, host, port, dml_file, password):
    try:

        if not os.path.isfile(dml_file):
            print(f"Файл {dml_file} не найден.")
            return

        execute_cmd = [
            'psql',
            '-U', user,
            '-h', host,
            '-d', target_db,
            '-f', dml_file,
            '-p', port
        ]
        
        os.environ['PGPASSWORD'] = password
        
        subprocess.run(execute_cmd, check=True)
        print(f"DML скрипт из файла {ddl_file} успешно выполнен в базе данных {target_db}.")
    except subprocess.CalledProcessError as e:
        print(f"Произошла ошибка при выполнении DDL скрипта: {e}")

if __name__ == "__main__":
    # target_db = os.getenv('TARGET_DB', 'etl_db_3')
    # target_user = os.getenv('TARGET_USER', 'etl_user_3')

    # target_host = os.getenv('TARGET_HOST', '10.82.0.4')
    # target_password = os.getenv('TARGET_PASSWORD', '(-`2loJV') 

    target_db = os.getenv('TARGET_DB', 'mila')
    target_user = os.getenv('TARGET_USER', 'postgres')

    target_host = os.getenv('TARGET_HOST', 'localhost')
    target_password = os.getenv('TARGET_PASSWORD', '123')   
    target_port = os.getenv('TARGET_PORT', '5434') 
    ddl_file = "dags/scripts/sql-scripts/dds_shema.sql"
    dml_file = "dags/scripts/sql-scripts/dds_data.sql"

    execute_ddl_script(target_db, target_user, target_host, target_port, ddl_file, target_password)
    execute_dml_script(target_db, target_user, target_host, target_port, dml_file, target_password)
