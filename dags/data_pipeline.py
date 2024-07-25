from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.utils.dates import days_ago
from airflow.models import Variable

default_args = {
    'owner': 'airflow',
    'start_date': days_ago(1),
    'retries': 1,
}

dag = DAG(
    'data_pipeline',
    default_args=default_args,
    description='обновление данных в слоях ods, dds и dm',
    schedule_interval='@daily',
)

source_hook = PostgresHook(postgres_conn_id='source_db')
source_conn = source_hook.get_conn()
source_dsn_params = source_conn.get_dsn_parameters()
source_db_host = source_dsn_params['host']
source_db_user = source_dsn_params['user']
source_db_name = source_dsn_params['dbname']
source_db_password = Variable.get("source_db_password")
source_schema_name = 'source_data'

target_hook = PostgresHook(postgres_conn_id='target_db')
target_conn = target_hook.get_conn()
target_dsn_params = target_conn.get_dsn_parameters()
target_db_host = target_dsn_params['host']
target_db_user = target_dsn_params['user']
target_db_name = target_dsn_params['dbname']
target_db_password = Variable.get("target_db_password")
target_schema_name = 'ods_data'

dump_file_path = '/opt/airflow/dags/scripts/sql-scripts/ods_refresh.sql'

create_dump = BashOperator(
    task_id='create_dump',
    bash_command=f"""
    PGPASSWORD='{source_db_password}' pg_dump -h {source_db_host} -U {source_db_user} -n {source_schema_name}  --data-only -f {dump_file_path} {source_db_name}
    """,
    dag=dag,
)

edit_dump = BashOperator(
    task_id='edit_dump',
    bash_command=f"""
    sed -i 's/source_data/ods_data/g' {dump_file_path}
    """,
    dag=dag,
)

clear_target_schema = PostgresOperator(
    task_id='clear_target_schema',
    postgres_conn_id='target_db',
    sql=f"""
        DO $$ DECLARE
            r RECORD;
        BEGIN
            FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = '{target_schema_name}') LOOP
                EXECUTE 'TRUNCATE TABLE {target_schema_name}.' || quote_ident(r.tablename) || ' CASCADE';
            END LOOP;
        END $$;
        """,
    dag=dag,
)

restore_dump = BashOperator(
    task_id='restore_dump',
    bash_command=f"""
    PGPASSWORD='{target_db_password}' psql -h {target_db_host} -U {target_db_user} -d {target_db_name} -f {dump_file_path}
    """,
    dag=dag,
)

update_dds_data = PostgresOperator(
    task_id = 'update_dds_data',
    postgres_conn_id='target_db',
    sql='scripts/sql-scripts/dds_refresh.sql',
    dag=dag,
)

update_dm_data = PostgresOperator(
    task_id = 'update_dm_data',
    postgres_conn_id='target_db',
    sql='scripts/sql-scripts/dm_refresh.sql',
    dag=dag,
)


create_dump >>  edit_dump >> clear_target_schema >> restore_dump >> update_dds_data >> update_dm_data