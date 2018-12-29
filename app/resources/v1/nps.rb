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
        scores = Score.where(created_at: params[:from]..params[:to])
        detractors = (scores.select { |item| item.rate >= 0 && item.rate <= 6 }).size * 100 / scores.size
        passives = (scores.select { |item| item.rate >= 7 && item.rate <= 8 }).size * 100 / scores.size
        promoters = (scores.select { |item| item.rate >= 9 }).size * 100 / scores.size

        {
          from: params[:from],
          to: params[:to],
          result: {
            detractors: detractors,
            promoters: promoters,
            passives: passives,
            total: (promoters - detractors)
          }
        }
      end
    end
  end
end
