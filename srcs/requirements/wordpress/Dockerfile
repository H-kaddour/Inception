FROM debian:buster

COPY ./tools/script.sh .

RUN chmod +x script.sh

#RUN ./script.sh
#RUN service php7.3-fpm start 

#ENTRYPOINT ["php"]
ENTRYPOINT ["./script.sh"]
