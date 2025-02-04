#!/bin/bash

hocon() {
  /opt/puppetlabs/puppet/lib/ruby/vendor_gems/bin/hocon "$@"
}

if [ "$PUPPETDB_CERTIFICATE_ALLOWLIST" != "" ]; then
  hocon -f /etc/puppetlabs/puppetdb/conf.d/puppetdb.conf set puppetdb.certificate-allowlist certificate-allowlist
  IFS=','
  for cert in $PUPPETDB_CERTIFICATE_ALLOWLIST; do
    echo $cert >> /opt/puppetlabs/server/apps/puppetdb/certificate-allowlist
  done
fi

