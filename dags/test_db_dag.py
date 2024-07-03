from airflow import DAG
import datetime
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
from airflow.operators.postgres_operator import PostgresOperator
from airflow.models import Variable

dag = DAG('test_postgres', description='test_postgres',
          start_date=datetime.datetime(2024, 7, 2), catchup=False)
start_step = DummyOperator(task_id="start_step", dag=dag)
task = PostgresOperator(task_id="insert_step",
                            sql="SELECT * FROM source_data.фреймворки_и_уровень_знаний_сотру ORDER BY название",
                            postgres_conn_id='source_db',
                            dag=dag)
end_step = DummyOperator(task_id="end_step", dag=dag)

start_step >> task >> end_step


