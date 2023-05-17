PATH = /home/hkaddour
FILE = srcs/docker-compose.yml
EXEC = /usr/local/bin

all: up

up:
	/usr/bin/docker ps
	$(EXEC)/docker-compose -f $(FILE) ps
	$(EXEC)/docker-compose -f $(FILE) build
	$(EXEC)/docker-compose -f $(FILE) up -d

build:
	$(EXEC)/docker-compose -f $(FILE) build

run:
	$(EXEC)/docker-compose -f $(FILE) up -d
#here add down
fclean:
	rm -rf $(PATH)/wordpress/* $(PATH)/mariadb/*

#here sudo or i will work in hkaddour home also change the hosts with the domaine

.PHONY: all up build run fclean
