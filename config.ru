# frozen_string_literal: true

require 'rack/throttle'

require File.expand_path('config/env', __dir__)

use Rack::Throttle::Second, max: 200
use OTR::ActiveRecord::ConnectionManagement

run Rack::Cascade.new([Survey::App])
