#!/bin/bash

if [ -z "$MY_RUBY_HOME" ]; then
    . /etc/profile.d/rvm.sh
    rvm use 2.6.1 >/dev/null
fi

export CERTDIR=/app/certificates
export SERVCERT=${CERTDIR}/jrc_prime256v1.crt
export SERVKEY=${CERTDIR}/jrc_prime256v1.key

RAILS_ENV=${RAILS_ENV-production}
export RAILS_ENV

cd /app/fountain

bundle exec thin start --ssl \
       --address ::    \
       --port    8081  \
       --user    fountain \
       --ssl-cert-file ${SERVCERT} \
       --ssl-key-file  ${SERVKEY} $@

echo DONE
