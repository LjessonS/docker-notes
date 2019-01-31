FROM hdc_base:v1

#ENV DEBIAN_FRONTEND noninteractive

# R3.2.3 mysql
RUN echo 'root:pwd' | chpasswd #设置镜像中的root用户密码
RUN mv /etc/apt/sources.list.bak /etc/apt/sources.list
RUN apt-get update && echo "mysql-server mysql-server/root_password password 123456" | debconf-set-selections && echo "mysql-server mysql-server/root_password_again password 123456" | debconf-set-selections && apt-get install -y mysql-server 

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/bin/supervisord"]
