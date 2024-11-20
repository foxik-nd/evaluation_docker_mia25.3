FROM mysql:8
COPY conf/init.sql /docker-entrypoint-initdb.d/
COPY .env .
EXPOSE 5655