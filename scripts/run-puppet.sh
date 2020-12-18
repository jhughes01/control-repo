#!/bin/bash

# /opt/puppetlabs/puppet/bin/r10k puppetfile install --verbose

CODE_DIR="/etc/puppetlabs/code/environments/production"

DEFAULT_ENVIRONMENT="production"
PUPPET_ENVIRONMENT="${1:-$DEFAULT_ENVIRONMENT}"

/opt/puppetlabs/puppet/bin/r10k deploy environment -pv

/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/"$PUPPET_ENVIRONMENT"/manifests/site.pp
