# frozen_string_literal: true

require 'sinatra/activerecord/rake'

namespace :db do
  task load_config: :environment do
    require './app'
  end
end

task :s do
  exec 'ruby app.rb -p 3000'
end

task :t do
  exec 'rspec'
end

task :lint do
  exec 'rubocop'
end

task :lint_fix do
  exec 'rubocop -A'
end
