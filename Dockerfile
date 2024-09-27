FROM clickhouse/clickhouse-server:latest

# SQL-скрипт для создания таблицы
COPY init-db.sql /docker-entrypoint-initdb.d/

RUN chmod 644 /docker-entrypoint-initdb.d/init-db.sql