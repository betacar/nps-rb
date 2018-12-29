# frozen_string_literal: true

require 'rack/throttle'

require File.expand_path('config/env', __dir__)

use OTR::ActiveRecord::ConnectionManagement
use Rack::Throttle::Second, max: 200

run Rack::Cascade.new([Survey::API])
