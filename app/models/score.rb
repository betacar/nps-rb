# frozen_string_literal: true

class Score < ActiveRecord::Base
  validates :rate, inclusion: { in: 0..10 }
end
