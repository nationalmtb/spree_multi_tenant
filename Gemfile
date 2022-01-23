source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'spree_core', '4.3.1'
gem 'spree_backend', '4.3.1'
gem 'spree_frontend', '4.3.1'
gem 'spree_emails', '4.3.1'
# Provides basic authentication functionality for testing parts of your engine
gem 'spree_auth_devise', '4.4.2'
gem 'rails-controller-testing'

gem 'sqlite3', '~> 1.4'

gem 'rubocop', require: false
gem 'rubocop-rspec', require: false

group :test do
  gem 'pg'
  gem 'redis', '4.4.0'
end

gemspec
