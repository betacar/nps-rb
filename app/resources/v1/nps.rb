# frozen_string_literal: true

require 'time'

module Survey
  class NpsV1 < Grape::API
    version 'v1', using: :path
    format :json

    resource :nps do
      desc 'Calculates and returns the NPS score'
      params do
        requires :from, type: String, desc: 'Start date.'
        optional :to, type: String, desc: 'End date.', default: Time.now.utc.iso8601
      end
      get do
      end
    end
  end
end
