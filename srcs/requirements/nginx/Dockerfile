FROM debian:buster
RUN apt-get update && apt-get install -y nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student"
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 443
COPY conf/wp_server.conf /etc/nginx/sites-enabled/
ENTRYPOINT ["nginx"]
