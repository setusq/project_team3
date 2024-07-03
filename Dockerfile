FROM apache/airflow:2.9.2

USER airflow
RUN pip install psycopg2-binary
ENTRYPOINT ["/entrypoint"]
CMD ["bash", "-c", " \
airflow db init && \
(airflow connections get 'source_db' || airflow connections add 'source_db' --conn-type 'postgres' --conn-host '10.82.0.4' --conn-schema 'source' --conn-login 'etl_user_3' --conn-password '(-`2loJV' --conn-port '5432') && \
airflow webserver"]
