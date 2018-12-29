# frozen_string_literal: true

module Survey
  class App < Grape::API
    format :json
    prefix :api

    mount ::Survey::Ping
    mount ::Survey::ScoreV1
    mount ::Survey::NpsV1
  end
end
