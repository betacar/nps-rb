# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Dir[File.expand_path('../app/**/*.rb', __dir__)].each { |file| require file }
OTR::ActiveRecord.configure_from_file! 'config/database.yml'

require 'survey'
