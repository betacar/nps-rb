# frozen_string_literal: true

require 'time'

module Survey
  class ScoreV1 < Grape::API
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
        score = Score.new
        score.rate = params[:rate]
        score.comment = params[:comment]
        score.user_id = params[:user_id]
        score.source = params[:source]
        score.created_at = params[:created_at] || Time.now.utc.iso8601
        score.save
        score
      end

      desc 'Fetches all scores'
      get do
        Score.all
      end
    end
  end
end
