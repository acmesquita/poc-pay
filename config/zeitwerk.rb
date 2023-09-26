# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir('app/')
loader.push_dir('app/core/models')
loader.push_dir('app/core/errors')
loader.push_dir('app/core/usecases')
loader.push_dir('app/adapters')
loader.push_dir('app/adapters/controllers')
loader.push_dir('app/adapters/repositories')
loader.push_dir('app/adapters/serializers')
loader.push_dir('lib')
loader.setup
