# Базовый образ - ClickHouse
FROM clickhouse/clickhouse-server:latest

# Копируем SQL-скрипт для создания таблицы
COPY init-db.sql /docker-entrypoint-initdb.d/
RUN chmod 644 /docker-entrypoint-initdb.d/init-db.sql

# Устанавливаем Python и необходимые пакеты
RUN apt-get update && apt-get install -y python3 python3-pip

# Копируем файл с зависимостями
COPY app/requirements.txt /app/requirements.txt

# Устанавливаем зависимости Python из requirements.txt
RUN pip3 install --no-cache-dir -r /app/requirements.txt

# Устанавливаем Jupyter
RUN pip3 install jupyter

# Создаем рабочую директорию для Jupyter Notebook
WORKDIR /notebooks

# Открываем порт для Jupyter Notebook
EXPOSE 8888

# Запускаем ClickHouse и Jupyter Notebook
CMD clickhouse-server & \
    jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=''
