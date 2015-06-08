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

# Heroku integration
RUN wget -qO- https://toolbelt.heroku.com/install.sh | sed 's/sudo //g' | sh
RUN ln -s /usr/local/heroku/bin/heroku /usr/local/bin/heroku
# user or deployments
RUN ["/usr/sbin/userdel", "ftp"]
RUN ["/usr/sbin/groupadd", "-g", "50", "staff"]
RUN ["/usr/sbin/useradd", "-N", "-u", "1000", "-g", "50", "deployer"]

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
CMD ["puma"]
