# frozen_string_literal: true

require "sinatra"
require "sinatra/activerecord"
require "dotenv/load"
require "byebug"

set :database, { adapter: "sqlite3", database: ENV.fetch("DB_PATH", nil) }
