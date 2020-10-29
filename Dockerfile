FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get  update -y
RUN apt-get install apache2 -y
RUN apt-get install libapache2-mod-php php -y

COPY index.php /var/www/html/

RUN apt-get install libaio1 libaio-dev
RUN apt-get install mysql-server -y

CMD usermod -d /var/lib/mysql/ mysql

RUN apt-get install net-tools -y
RUN apt-get install curl -y

EXPOSE 3210
EXPOSE 8080

COPY apache apache
COPY mysql mysql
COPY start_service.sh start_service.sh
RUN chmod +x ./start_service.sh
CMD ./start_service.sh

CMD mysql
