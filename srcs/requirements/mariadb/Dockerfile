FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY ./tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT ["./script.sh"]
