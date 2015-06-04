FROM jruby:9.0.0.0
MAINTAINER Darin London <darin.london@duke.edu>

RUN ["mkdir", "/root/installs"]
WORKDIR /root/installs
RUN apt-get update && apt-get install -y openssl --no-install-recommends && rm -rf /var/lib/apt/lists/*

# ssl certs
ADD docker/includes/install_ssl_cert.sh /root/installs/install_ssl_cert.sh
ADD docker/includes/cert_config /root/installs/cert_config
RUN ["chmod", "u+x", "/root/installs/install_ssl_cert.sh"]
RUN ["/root/installs/install_ssl_cert.sh"]

#Postgresql client
RUN apt-get update && apt-get install -y postgresql --no-install-recommends && rm -rf /var/lib/apt/lists/*

#miscellaneous
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN ["mkdir","-p","/var/www/app"]
WORKDIR /var/www/app
ADD Gemfile /var/www/app/Gemfile
ADD Gemfile.lock /var/www/app/Gemfile.lock
RUN ["bundle", "install"]

# run the app by defualt
EXPOSE 3000
CMD ["puma", "-b", "ssl://0.0.0.0:3000?key=/etc/pki/tls/private/localhost.key&cert=/etc/pki/tls/certs/localhost.crt&keystore=/var/www/app/config/keystore/keystore.jks&keystore-pass=password"]
