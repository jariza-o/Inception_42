FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt -y install nginx ufw
RUN ufw allow https

RUN mkdir -p /mnt/wp

RUN mkdir -p /root/tools

COPY ./tools/config_nginx.sh /root/tools/config_nginx.sh
RUN rm -f /etc/nginx/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /etc/nginx/nginx.conf

RUN chmod +x /root/tools/config_nginx.sh

RUN /root/tools/config_nginx.sh

CMD ["nginx", "-g", "daemon off;"]