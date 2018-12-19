FROM mysql:5.6
COPY ./my.cnf /etc/mysql/conf.d/
RUN chmod 644 /etc/mysql/conf.d/my.cnf
MAINTAINER enrich @team

ENV MYSQL_DATABASE=db \
    MYSQL_ROOT_PASSWORD=root

COPY ./db.sql.tar.gz /tmp/db.sql.tar.gz
COPY ./setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

EXPOSE 3306
