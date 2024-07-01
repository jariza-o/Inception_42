FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt -y install nginx ufw
RUN ufw allow https
# RUN systemctl start nginx.service
RUN mkdir -p /mnt/wp

RUN mkdir -p /root/tools

COPY ./tools/config_nginx.sh /root/tools/config_nginx.sh
# COPY ./conf/openssl.conf /root/conf/openssl.conf
RUN rm -f /etc/nginx/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# COPY ./conf/index.html /var/www/html/index.html
RUN chmod 755 /etc/nginx/nginx.conf

RUN chmod +x /root/tools/config_nginx.sh
# RUN chmod +x /root/conf/openssl.conf

RUN /root/tools/config_nginx.sh

#NO SE ESTO PARA QUE ES
# RUN unlink /etc/nginx/sites-enabled/default
# COPY ./conf/jariza-o.42.fr /etc/nginx/sites-available/
# RUN ln -s /etc/nginx/sites-available/jariza-o.42.fr /etc/nginx/sites-enabled/



# CMD ["nginx", "-g", "daemon off;"]
CMD ["bash", "-c", "while true; do echo 'Container is running'; sleep 5; done"]



# CMD [""]
# docker run -d test4 bash -c "while true; do echo 'Container is running'; sleep 5;done"
# docker run -it <id o name> /bin/bash