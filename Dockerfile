#Utilizamos imagen Ubuntu
FROM ubuntu:latest

RUN apt-get update && apt-get install -y git wget zip imagemagick

COPY . /home/programa

WORKDIR /home/programa

CMD [mkdir resultado]
CMD ["bash", "/home/programa/menu.sh"]
