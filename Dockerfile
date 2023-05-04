# Этап 1: сборка образа с PostgreSQL
FROM postgres:latest
MAINTAINER Dmitry TF <Robbin-the-Bobbin@yandex.ru>

# устанавливаем рабочую директорию
WORKDIR /usr/src/app

# копируем исходный код и сценарии инициализации в контейнер
COPY init.sql /docker-entrypoint-initdb.d/
COPY postgresql.conf /usr/local/etc/postgresql/

# настраиваем переменную окружения для Postgres
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypass
ENV POSTGRES_DB=mydb

# добавляем volume для сохранения данных вне контейнера
VOLUME /var/lib/postgresql/data

# задаем пользователя и группу, которые будут запускать контейнер
USER postgres

# Этап 2: создание образа с Nginx
FROM nginx:latest

# копируем конфигурационный файл Nginx в контейнер
COPY nginx.conf /etc/nginx/nginx.conf

# добавляем volume для сохранения логов
VOLUME /var/log/nginx

# задаем порт, который будет использоваться в контейнере
EXPOSE 80

# задаем рабочую директорию для Nginx
WORKDIR /usr/share/nginx/html

# копируем файлы для веб-сервера в контейнер
COPY index.html .

# задаем пользователя и группу, которые будут запускать контейнер
USER nginx
