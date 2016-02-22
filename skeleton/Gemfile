source 'https://rubygems.org'

group :tests do
  gem 'puppetlabs_spec_helper'
  gem 'puppet-lint'
  gem 'rspec'
  gem 'rspec-puppet'
  gem 'rspec-puppet-facts'
  gem 'metadata-json-lint'
end

group :development do
  gem "puppet-blacksmith"
end

if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end
