FROM ubuntu:jammy
LABEL author="Fábio Valentim de Jesus Silva"
LABEL site=www.baudovalentim.net
LABEL email=valentim@baudovalentim.net

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/Sao_Paulo

ENV LANG pt_BR.utf8

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN \
  apt update && \
  apt install -y \
  apt-utils \
  curl \
  cron \
  locales \
  nano \
  sendmail \
  sqlite3 \
  libsqlite3-dev \
  unzip \
  git \
  mcrypt \
  tzdata \
  wget && \
  localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8 && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt install -y apache2 libapache2-mod-php php-cgi \ 
  php php-imap php-mysql php-curl php-intl php-sqlite3 php-gd php-json php-cli php-opcache php-xml php-redis php-mbstring php-xml php-zip php-ldap php-pgsql php-xdebug php-pdo && \
  a2enmod ldap && a2enmod authnz_ldap && a2enmod rewrite && a2enmod

RUN apt clean

EXPOSE 80

WORKDIR /var/www/html


