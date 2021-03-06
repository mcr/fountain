FROM ruby:2.6.6 as builder

RUN apt-get update -qq && apt-get install -y postgresql-client libgmp10-dev libgmp10 sash busybox dnsutils apt-utils zip dnsutils && \
    apt-get remove -y git &&  \
    apt-get install -y git

# build custom openssl with ruby-openssl patches

# remove directory with broken opensslconf.h,
# build in /src, as we do not need openssl once installed
RUN rm -rf /usr/include/x86_64-linux-gnu/openssl && \
    mkdir -p /src/minerva && \
    cd /src/minerva && \
    git clone -b dtls-listen-refactor-1.1.1c git://github.com/mcr/openssl.git && \
    cd /src/minerva/openssl && \
    ./Configure --prefix=/usr --openssldir=/usr/lib/ssl --libdir=lib/x86_64-linux-gnu no-idea no-mdc2 no-rc5 no-zlib no-ssl3                  linux-x86_64 && \
    id && make

RUN cd /src/minerva/openssl && make install_sw

RUN mkdir -p /app/minerva && cd /app/minerva && \
    gem install rake-compiler --source=http://rubygems.org && \
    git clone --single-branch --branch ies-cms-dtls https://github.com/CIRALabs/ruby-openssl.git && \
    cd /app/minerva/ruby-openssl && rake compile

RUN mkdir -p /app/minerva && cd /app/minerva && \
    git config --global http.sslVerify "false" && \
    git clone --single-branch --branch binary_http_multipart https://github.com/AnimaGUS-minerva/multipart_body.git && \
    git clone --single-branch --branch ecdsa_interface_openssl https://github.com/AnimaGUS-minerva/ruby_ecdsa.git && \
    git clone --single-branch --branch v0.8.0 https://github.com/mcr/ChariWTs.git chariwt && \
    git clone --single-branch --branch master https://github.com/AnimaGUS-minerva/david.git && \
    git clone --single-branch --branch aaaa_rr https://github.com/CIRALabs/dns-update.git

RUN touch /app/v202004

WORKDIR /app
RUN gem install bundler --source=http://rubygems.org

