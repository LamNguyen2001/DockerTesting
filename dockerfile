# build a new image from image centos:latest (CENTOS 7)
FROM centos:7

#LABEL Remarks="This is a dockerfile for web server in Centos 7 system"

# update the system
RUN yum update -y

# install apapche server
RUN yum install httpd -y


#RUN yum clean all

# define working directory
# WORKDIR /var/www/html
WORKDIR /

# copy .html file into folder /var/www/html on the docker image 
# to serve content on the webserver
COPY ./the_converter.html /var/www/html/

RUN rm /etc/httpd/conf/httpd.conf

COPY ./httpd.conf /etc/httpd/conf/httpd.conf



# open port 80 to allow access to the outside world
EXPOSE 80

# auto enable httpd when run container
#ENTRYPOINT ["/usr/sbin/httpd"]
ENTRYPOINT ["httpd"]

#run in the foreground
CMD ["-D", "FOREGROUND"]


