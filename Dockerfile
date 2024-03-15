FROM debian:bullseye
# I can just use existing container but let's make it manually from Debian, old enough to contain PHP 7.4 :-)

# Installing Apache + PHP 7.4 with MySQL support and sleanin the cache to reduce container size
RUN apt-get update -y && apt-get install -y apache2 php7.4 php7.4-mysql libapache2-mod-php7.4 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Setting the working directory
WORKDIR /var/www/html

# Exposing port 80 for Apache to listen on
EXPOSE 80

# Launching apache2 on startup
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
