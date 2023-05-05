FROM debian:bullseye
RUN apt-get update && apt-get install -y nginx && apt-get install openssl -y
RUN mv /var/www/html/index.nginx-debian.html /var/www/html/index.html
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student"

#here try to run wordpress
#RUN wget
####
EXPOSE 443
COPY ./conf/nginx.conf /etc/nginx
#ENTRYPOINT ["nginx"]

#ENTRYPOINT ["nginx", "-g", "daemon off;"]
#ENTRYPOINT ["/bin/bash"]
