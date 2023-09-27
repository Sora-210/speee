# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :prefecture
  belongs_to :city
  has_many :assessment_areas
  has_many :reviews
  has_many :assessments
  def all_average_score
    total_score = (speed_average_score + price_average_score + support_average_score) / 3
    total_score.round(1)
  end

  def speed_average_score
    score = reviews.average(:speed_cs).to_f
    score.round(1)
  end

  def price_average_score
    score = reviews.average(:price_cs).to_f
    score.round(1)
  end

  def support_average_score
    score = reviews.average(:support_cs).to_f
    score.round(1)
  end
end
