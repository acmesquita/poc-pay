# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir('app/')
loader.push_dir('app/domain/models')
loader.push_dir('app/domain/errors')
loader.push_dir('app/domain/repositories')
loader.push_dir('app/usecases')
loader.push_dir('app/infra/controllers')
loader.push_dir('app/infra/serializers')
loader.push_dir('lib')
loader.setup
