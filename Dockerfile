FROM php
WORKDIR /var/www/html
RUN docker-php-ext-install mysqli 
COPY ./t37import /var/www/html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80


FROM node as task37api
WORKDIR /usr/app
RUN npm install cors mysql express url 
COPY ./script .

FROM node as sankeyapi
WORKDIR /usr/app
RUN npm install cors mysql express url
COPY ./script .
