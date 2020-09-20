##Descargamos una versión concreta de UBUNTU, a través del tag
FROM ubuntu
MAINTAINER baitsoft.net "gerardo.morales@baitsoft.net"

##Actualizamos el sistema
RUN apt-get update

##Instalamos nginx
RUN apt-get install -y nginx

##Creamos un fichero index.html en el directorio por defecto de nginx
#RUN echo '<html><body><h1>Hola Alo Hello</h1></body></html>' > /var/www/html/index.html
VOLUME /var/www/html/
#ARG web
#ADD $web /var/www/html/
ADD web /var/www/html/

##Arrancamos NGINX a través de ENTRYPOINT para que no se pueda
##modificar en la creación del contenedor
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

##Exponemos el Puerto 80
EXPOSE 80
