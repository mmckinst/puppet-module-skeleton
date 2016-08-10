#!/bin/bash

set -e
set -x 

mkdir -p $(puppet apply --configprint module_working_dir)
ln -s $(pwd)/skeleton/ $(puppet apply --configprint module_working_dir)/skeleton

puppet module generate johndoe-ntp --skip-interview

# puppet 3 creates modules as 'username-modulename', puppet 4 creates them as
# 'modulename'
if [[ -e johndoe-ntp ]]; then
    mv johndoe-ntp ntp
fi

cd ntp

# https://tickets.puppetlabs.com/browse/PUP-3894
sed -i 's/Apache 2.0/Apache-2.0/' metadata.json


BUNDLE_GEMFILE=./Gemfile bundle install --without system_tests
BUNDLE_GEMFILE=./Gemfile bundle exec rake validate
BUNDLE_GEMFILE=./Gemfile bundle exec rake lint
BUNDLE_GEMFILE=./Gemfile bundle exec rake spec
