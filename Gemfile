# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'activerecord', '~> 5.2', require: 'active_record'
gem 'grape'
gem 'otr-activerecord', '~> 1.2', '>= 1.2.6'
gem 'grape-entity'
gem 'rack-cors'
gem 'rack-throttle'
gem 'pg'
gem 'puma'

group :development do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rack'
  gem 'rake'
  gem 'rubocop'
end

group :test do
  gem 'capybara'
  gem 'rack-test'
  gem 'rspec'
end
