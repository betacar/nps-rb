# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'rake'
require 'rspec/core'
require 'rspec/core/rake_task'

load 'tasks/otr-activerecord.rake'
RSpec::Core::RakeTask.new(:spec)

namespace :db do
  task :environment do
    require File.expand_path('config/env', __dir__)
  end
end

task :environment do
  require File.expand_path('config/env', __dir__)
end

task routes: :environment do
  Survey::App.routes.each do |route|
    method = route.request_method.ljust(7)
    path = route.origin.ljust(22)
    description = route.options[:description]
    puts "   #{method} #{path} #{description}"
  end
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

task default: %i[rubocop spec]
