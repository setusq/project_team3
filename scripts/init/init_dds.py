'''
Cкрипт выполняет инициализацию слоя данных (DDS) в целевой базе данных.
Он загружает и выполняет DDL скрипт, который создает схему и таблицы, необходимые для работы с данными в DDS слое.
'''



import subprocess
import os

def execute_ddl_script(target_db, user, host, ddl_file, password):
    try:

        if not os.path.isfile(ddl_file):
            print(f"Файл {ddl_file} не найден.")
            return

        execute_cmd = [
            'psql',
            '-U', user,
            '-h', host,
            '-d', target_db,
            '-f', ddl_file
        ]
        
        os.environ['PGPASSWORD'] = password
        
        subprocess.run(execute_cmd, check=True)
        print(f"DDL скрипт из файла {ddl_file} успешно выполнен в базе данных {target_db}.")
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при выполнении DDL скрипта: {e}")

if __name__ == "__main__":
    target_db = os.getenv('TARGET_DB', 'mila')
    target_user = os.getenv('TARGET_USER', 'postgres')

    target_host = os.getenv('TARGET_HOST', 'localhost')
    target_password = os.getenv('TARGET_PASSWORD', '123')  
    
    ddl_file = "scripts/sql-scripts/dds_shema.sql"

    execute_ddl_script(target_db, target_user, target_host, ddl_file, target_password)
