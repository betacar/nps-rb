# frozen_string_literal: true

require 'time'

module Survey
  class NpsV1 < Grape::API
    version 'v1', using: :path
    format :json

    helpers do
      def percentage(num, all)
        return 0 unless all.positive?

        (num.size / all) * 100
      end
    end

    resource :nps do
      desc 'Calculates and returns the NPS score'
      params do
        requires :from, type: String, desc: 'Start date.'
        optional :to, type: String, desc: 'End date.', default: Time.now.utc.iso8601
      end
      get do
        scores = Score.where(created_at: params[:from]..params[:to])
        all_scores = scores.size
        detractors = scores.select { |item| item.rate >= 0 && item.rate <= 6 }
        passives = scores.select { |item| item.rate >= 7 && item.rate <= 8 }
        promoters = scores.select { |item| item.rate >= 9 }
        detractor_perc = percentage(detractors, all_scores)
        promoter_perc = percentage(promoters, all_scores)

        {
          from: params[:from],
          to: params[:to],
          result: {
            detractors: detractor_perc,
            promoters: promoter_perc,
            passives: percentage(passives, all_scores),
            total: (promoter_perc - detractor_perc)
          }
        }
      end
    end
  end
end
