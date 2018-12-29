# frozen_string_literal: true

require 'time'

module Survey
  class ScoreV1 < Grape::API
    attr_reader :scores

    version 'v1', using: :path
    format :json

    resource :scores do
      desc 'Submits a survey score'
      params do
        requires :rate, type: Integer, desc: 'Score rate.', values: (0..10).to_a
        optional :user_id, type: String, desc: 'User ID.'
        optional :comment, type: String, desc: 'Score comment.'
        optional :source, type: String, desc: 'Source URL.'
      end
      post do
        @scores = [] unless @scores && @scores.size > 1
        @scores.push(
          rate: params[:rate],
          comment: params[:comment],
          user_id: params[:user_id],
          source: params[:source],
          created_at: Time.now.utc.iso8601
        )
        @scores.last
      end

      desc 'Fetches all scores'
      get do
        @scores || []
      end
    end
  end
end
