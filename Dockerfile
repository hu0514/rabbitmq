FROM centos
#COPY ./files/rabbitmq.conf /usr/local/rabbitmq/etc/rabbitmq/rabbitmq.conf
#COPY ./files/rabbitmq-env.conf /usr/local/rabbitmq/etc/rabbitmq/rabbitmq-env.conf
#install base pages
RUN yum install epel-release wget gcc make perl ncurses-devel openssl openssl-devel flex gcc-c++ byacc -y \

#install unixodbc
    && cd /tmp \
    && wget http://www.unixodbc.org/unixODBC-2.3.7.tar.gz \
    && tar zxvf unixODBC-2.3.7.tar.gz \
    && cd unixODBC-2.3.7 \
    && ./configure --x-includes=/usr/include/X11 --x-libraries=/usr/lib/X11 \
    && make && make install \
    && cd .. \

#install otp_src
    && wget http://erlang.org/download/otp_src_21.3.tar.gz \
    && tar zxvf otp_src_21.3.tar.gz \
    && cd otp_src_21.3 \
    && ./configure --without-javac \
    && make && make install \
    && cd .. \

#install rabbitmq
    && wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.15/rabbitmq-server-generic-unix-3.7.15.tar.xz \
    && tar xvf rabbitmq-server-generic-unix-3.7.15.tar.xz \
    && mkdir -p /usr/local/rabbitmq \
    && mv rabbitmq_server-3.7.15/* /usr/local/rabbitmq \
    && cd .. \
    && rm -rf /tmp/* \
    && yum clean all 
#RUN mkdir -p /data/rabbitmq/log \
#    && mkdir -p /data/rabbitmq/mnesia
COPY ./files/rabbitmq.conf /usr/local/rabbitmq/etc/rabbitmq/rabbitmq.conf
COPY ./files/rabbitmq-env.conf /usr/local/rabbitmq/etc/rabbitmq/rabbitmq-env.conf
COPY ./files/setup.sh /mnt/
RUN chmod +755 /mnt/setup.sh
ENTRYPOINT ["/mnt/setup.sh"]
