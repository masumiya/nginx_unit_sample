FROM ubuntu:latest

EXPOSE 8300 8400

RUN apt-get update && \
    apt-get -y install wget && \
    wget http://nginx.org/keys/nginx_signing.key && \
    apt-key add nginx_signing.key && \
    echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >>  /etc/apt/sources.list && \
    echo "deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >>  /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y install unit php python python-pip vim net-tools && \
    mkdir -p /www/{php-app,py-app} && \
    pip install flask && \
    apt-get clean

COPY wsgi.py /www/py-app/
COPY index.php /www/php-app/
COPY config.json /etc/unit/

CMD service unitd start && curl -X PUT -d @/etc/unit/config.json --unix-socket /run/control.unit.sock http://localhost/ && tail -f /var/log/unitd.log
