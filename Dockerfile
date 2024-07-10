# FROM apache/airflow:2.9.2

# USER airflow
# RUN pip install psycopg2-binary
# ENTRYPOINT ["/entrypoint"]
# CMD ["bash", "-c", " \
# airflow db init && \
# (airflow connections get 'source_db' || airflow connections add 'source_db' --conn-type 'postgres' --conn-host '10.82.0.4' --conn-schema 'source' --conn-login 'etl_user_3' --conn-password '(-`2loJV' --conn-port '5432') && \
# airflow webserver"]

# RUN apt-get update --no-cache  && \
#     apt-get install -y postgresql-client-16 && \
#     apt-get clean



# Use the official Apache Airflow image
FROM apache/airflow:2.9.2

# Switch to airflow user to install Python packages
USER airflow

# Install psycopg2-binary
RUN pip install psycopg2-binary

# Switch to root user to perform system-level operations
USER root

# Update and install postgresql-client-16
RUN apt-get update && \
    apt-get install -y postgresql-client-16 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the airflow user
USER airflow

# Set entrypoint and default command
ENTRYPOINT ["/entrypoint"]
CMD ["bash", "-c", " \
airflow db init && \
(airflow connections get 'source_db' || airflow connections add 'source_db' --conn-type 'postgres' --conn-host '10.82.0.4' --conn-schema 'source' --conn-login 'etl_user_3' --conn-password '(-`2loJV' --conn-port '5432') && \
airflow webserver"]

