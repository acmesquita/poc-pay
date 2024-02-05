# frozen_string_literal: true

require './app'
require 'sinatra/activerecord/rake'

namespace :db do
  task load_config: :environment do
    require './app'
  end
end

task :s do
  exec 'ruby app.rb -p 3000'
end

task :server do
  exec 'ruby app.rb -p 3000'
end

task :t do
  exec 'bundle exec rspec'
end

task :test do
  exec 'bundle exec rspec'
end

task :lint do
  exec 'bundle exec rubocop'
end

task :lint_fix do
  exec 'bundle exec rubocop -A'
end

task :setup do
  exec 'bundle exec rake db:create db:migrate'
end
