#!/bin/bash

CODE_DIR="/etc/puppetlabs/code/environments/production"

rm -rf "$CODE_DIR" && git clone https://github.com/jhughes01/control-repo "$CODE_DIR"
cd "$CODE_DIR"
/opt/puppetlabs/puppet/bin/r10k puppetfile install --verbose
/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp