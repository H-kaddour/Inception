FROM debian:latest

RUN apt-get update && apt-get install -y nginx

#EXPOSE 1599

#RUN apt-get install -y systemctl && systemctl start nginx

ENTRYPOINT ["nginx", "-g", "daemon off;"]
#ENTRYPOINT ["/bin/bash"]
