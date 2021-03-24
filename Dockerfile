FROM ubuntu:16.04
#Update ubuntu
RUN apt-get Update
RUN apt-get install -y nginx
# Install mysql server
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
    && apt-get install -y mysql-server
WORKDIR /venv

COPY start.sh /venv

RUN chmod a+x /venv/*

ENTRYPOINT ["/venv/start.sh"]

EXPOSE 80