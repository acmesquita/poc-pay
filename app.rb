# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'
require 'byebug'
require 'zeitwerk'

set :database, { adapter: 'sqlite3', database: ENV.fetch('DB_PATH', nil) }

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/app/")
loader.push_dir("#{__dir__}/app/domain/models")
loader.push_dir("#{__dir__}/app/domain/errors")
loader.push_dir("#{__dir__}/app/domain/repositories")
loader.push_dir("#{__dir__}/app/usecases")
loader.push_dir("#{__dir__}/app/infra/controllers")
loader.push_dir("#{__dir__}/app/infra/serializers")
loader.push_dir("#{__dir__}/lib")
loader.setup

require './app/infra/routes'
