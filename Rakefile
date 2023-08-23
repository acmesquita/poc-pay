# frozen_string_literal: true

require 'sinatra/activerecord/rake'

namespace :db do
  task load_config: :environment do
    require './app'
  end
end

task s: :environment do
  exec 'ruby app.rb -p 3000'
end
