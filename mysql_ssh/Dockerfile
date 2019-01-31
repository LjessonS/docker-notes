FROM ubuntu:16.04

RUN echo 'root:pwd' | chpasswd #设置镜像中的root用户密码

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt/sources.list
# ssh supervisor git ifconfig sudo htop bunzip2 make quiet_install
RUN apt-get update && apt-get install -y vim openssh-server supervisor git net-tools iputils-ping sudo htop bzip2 make gcc libz-dev debconf-utils 

# supervisor
COPY supervisord.conf /etc/supervisord.conf
RUN mkdir -p /etc/supervisor.conf.d && \
        mkdir -p /var/log/supervisor

# SSH-conf
RUN mkdir /root/.ssh && chmod 700 /root/.ssh && mkdir /var/run/sshd
RUN touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# create user liusheng
RUN useradd --create-home --no-log-init --shell /bin/bash liusheng && adduser liusheng sudo && echo 'liusheng:ls' | chpasswd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
CMD ["/usr/bin/supervisord"]
