# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'dotenv'
gem 'puma'
gem 'rake'
gem 'rest-client'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'sqlite3'
gem 'zeitwerk'

group :test do
  gem 'database_cleaner-active_record'
  gem 'rack-test'
  gem 'rspec'
  gem 'simplecov'
end

group :development do
  gem 'byebug'
  gem 'rubocop'
  gem 'rubocop-rspec'
end
