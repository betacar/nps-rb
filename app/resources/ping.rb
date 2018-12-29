# frozen_string_literal: true

module Survey
  class Ping < Grape::API
    format :json

    desc 'Ping!'
    get '/ping' do
      { ping: 'pong' }
    end
  end
end
