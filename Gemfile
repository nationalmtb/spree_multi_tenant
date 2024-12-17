source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'spree_core', '4.10.1'
gem 'spree_backend', '4.8.4'
gem 'spree_frontend', '4.8.0'
gem 'spree_emails', '4.10.0'
# Provides basic authentication functionality for testing parts of your engine
gem 'spree_auth_devise', '4.6.3'
gem 'rails-controller-testing'

gem 'sqlite3'

gem 'rubocop', require: false
gem 'rubocop-rspec', require: false

group :test do
  gem 'pg'
  gem 'redis', '5.3.0'
  gem 'email_spec'
end

gemspec
