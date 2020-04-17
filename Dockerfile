#
# MAINTAINER        dockerxman,xiongjun <fenyunxx@163.com>
# DOCKER-VERSION    1.7.1
#
# Dockerizing ubuntu14.04: Dockerfile for building ubuntu images
#
FROM       ubuntu:14.04
MAINTAINER b1b2b3b4b5b6 <a1439458305@163.com>

ENV TZ "Asia/Shanghai"
ENV TERM xterm

ADD sources.list /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y unzip
RUN apt-get install -y vim
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y supervisor

RUN apt-get install -y nginx

RUN apt-get install -y openssl
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y mcrypt

RUN apt-get install -y php5-fpm
RUN apt-get install -y php5-cli
RUN apt-get install -y php5-curl
RUN apt-get install -y php5-mcrypt
RUN apt-get install -y php5-gd
RUN apt-get install -y php5-mysql
RUN apt-get install -y php5-json
RUN apt-get install -y php5-readline
RUN apt-get install -y php5-xcache
RUN apt-get install -y php-pear

RUN apt-get clean
RUN apt-get autoclean

RUN rm -rf /usr/share/nginx/html 

RUN mkdir /www

ADD nginx.conf /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/default

RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php5/cli/php.ini
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php5/fpm/php.ini

ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD supervisor_nginx.conf /etc/supervisor/conf.d/supervisor_nginx.conf
ADD supervisor_php-fpm.conf /etc/supervisor/conf.d/supervisor_php-fpm.conf
ADD www.conf /etc/php5/fpm/pool.d/www.conf


VOLUME ["/www/gitblog-master/blog"]

EXPOSE 80

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
