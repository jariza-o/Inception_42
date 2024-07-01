#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Creating SSL certs with openssl (nginx no read correct the cert)
    # echo "${RED}Creating a self-signed key pair and certificates${NC}"
    # mkdir /etc/nginx/ssl
    # openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/jariza-o.42.fr.crt -out /etc/nginx/ssl/jariza-o.42.fr.key -config /root/conf/openssl.conf 
    # echo "${GREEN}Certificates Created${NC}"
    # chmod 777 /etc/nginx/ssl/*

# Creating SSL Certs with MKCERT (Not used because work the first option)
    echo "${BLUE}Install Dependencies${NC}"
    apt install -y wget curl libnss3-tools
    echo "${GREEN}Dependencies Installed${NC}"

    echo "${BLUE}Downloading and Installing MKCERT${NC}"
    curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
    chmod +x mkcert-v*-linux-amd64
    cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert
    echo "${GREEN}MKCERT Installed${NC}"

    echo "${BLUE}Creatign SSL Certs${NC}"
    mkdir /etc/nginx/ssl
    cd /etc/nginx/ssl/
    mkcert jariza-o.42.fr
    mv jariza-o.42.fr-key.pem jariza-o.42.fr.key
    mv jariza-o.42.fr.pem jariza-o.42.fr.crt
    echo "${GREEN}SSL Certs Created${NC}"
    chmod 777 /etc/nginx/ssl/*