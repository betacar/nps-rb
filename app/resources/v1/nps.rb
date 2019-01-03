# frozen_string_literal: true

require 'time'

module Survey
  class NpsV1 < Grape::API
    version 'v1', using: :path
    format :json

    helpers do
      def percentage(num, all)
        num.size * 100 / all
      end
    end

    resource :nps do
      desc 'Calculates and returns the NPS score'
      params do
        requires :from, type: DateTime, desc: 'Start date.'
        optional :to, type: DateTime, desc: 'End date.', default: Time.now.end_of_day.utc.iso8601
      end
      get do
        scores = Score.where(['created_at >= ? AND created_at <= ?', params[:from], params[:to]])
        all_scores = scores.to_a.size

        unless all_scores.positive?
          return {
            result: 0
          }
        end

        detractors = scores.select { |item| item.rate >= 0 && item.rate <= 6 }
        detractor_perc = percentage(detractors, all_scores)
        promoters = scores.select { |item| item.rate >= 9 }
        promoter_perc = percentage(promoters, all_scores)

        {
          result: (promoter_perc - detractor_perc)
        }
      end
    end
  end
end
