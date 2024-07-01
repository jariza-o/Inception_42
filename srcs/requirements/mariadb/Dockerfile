FROM debian:bullseye

EXPOSE 3306
# RUN mkdir -p /var/lib/mariadb/

RUN apt update -y && apt upgrade -y
RUN apt -y install mariadb-server && rm -rf /var/lib/apt/lists/*

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

# Create the directory for the MySQL socket
RUN mkdir -p /run/mysqld/ && \
    chown -R mysql:mysql /run/mysqld/ && \
    chmod -R 755 /run/mysqld 


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mkdir -p /root/tools/
COPY ./tools/config.sh /root/tools/config.sh
RUN chmod -R 777 /root/tools/config.sh
# RUN bash /root/tools/config.sh

# ENTRYPOINT [ "bash", "/root/tools/config.sh" ]
# CMD [ "bash", "/root/tools/config.sh" ]
# CMD ["bash", "-c", "while true; do echo 'Container is running'; sleep 5; done"]

# CMD ["mysqld"]

CMD [ "bash", "/root/tools/config.sh" ]