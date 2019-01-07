FROM postgres:alpine
ADD wiki.sql /docker-entrypoint-initdb.d
COPY psqlrc /root/.psqlrc