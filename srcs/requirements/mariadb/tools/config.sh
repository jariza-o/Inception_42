#!bin/sh

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[39m'


echo "${BLUE}Start MYSQL ${NC}"
# service mariadb start;
mysqld_safe &
sleep 10
echo "${GREEN}MYSQL Started${NC}"

echo "${BLUE}Create MYSQL Root User ${NC}"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
echo "${GREEN}MYSQL Root User Created${NC}"


echo "${BLUE}Create MYSQL DataBase ${NC}"
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE_NAME}\`;"
echo "${GREEN}MYSQL Started${NC}"


echo "${BLUE}Create MYSQL User ${NC}"
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE_NAME}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "${GREEN}MYSQL User Created${NC}"



mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
exec mysqld_safe