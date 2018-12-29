# frozen_string_literal: true

require 'ostruct'
require 'pathname'

# Load environment settings
Config = OpenStruct.new
env = ENV['RACK_ENV'] || :development
Config.env = env.to_sym
Config.root = Pathname.new(File.expand_path('..', __dir__))

# Load dependencies
require 'bundler'
Bundler.require(:default, Config.env)
require File.expand_path('app', __dir__)
