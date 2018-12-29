# frozen_string_literal: true

50000.times.each do
  Score.create(rate: Random.rand(10))
end
