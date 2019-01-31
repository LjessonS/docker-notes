FROM ubuntu:16.04

RUN echo 'root:pwd' | chpasswd #设置镜像中的root用户密码
#ENV DEBIAN_FRONTEND noninteractive   

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim openssh-server supervisor git debconf-utils && echo "mysql-server mysql-server/root_password password 123456" | debconf-set-selections && echo "mysql-server mysql-server/root_password_again password 123456" | debconf-set-selections && apt-get install -y mysql-server 
# mysql
#COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# SSH-conf
RUN mkdir /root/.ssh && chmod 700 /root/.ssh && mkdir /var/run/sshd
RUN touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# supervisor
COPY supervisord.conf /etc/supervisord.conf
RUN mkdir -p /etc/supervisor.conf.d && \
		mkdir -p /var/log/supervisor

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# ssh mysql
EXPOSE 22
CMD ["/usr/bin/supervisord"]
