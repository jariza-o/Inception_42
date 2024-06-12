FROM debian:bullseye

RUN mkdir -p /var/lib/mariadb/

RUN apt update -y && apt upgrade -y
RUN apt -y install mariadb-server


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mkdir -p /root/tools/
COPY ./tools/config.sh /root/tools/config.sh
RUN chmod -R 777 /root/tools/config.sh

CMD [ "bash", "/root/tools/config.sh" ]
