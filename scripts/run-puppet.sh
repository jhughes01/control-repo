#!/usr/bin/env bash

cd /etc/puppetlabs/code/environments/production && git pull
/opt/puppetlabs/puppet/bin/r10k puppetfile install
/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp