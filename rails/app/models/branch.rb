class Branch < ApplicationRecord
    belongs_to :company
    belongs_to :prefecture
    belongs_to :city
    has_many :assesment_areas
    has_many :reviews
    has_many :assesments
    def average_score
        target_reviews = reviews
        total_score = 0
        total_score += target_reviews.average(:speed_cs).to_f
        total_score += target_reviews.average(:price_cs).to_f
        total_score += target_reviews.average(:support_cs).to_f
        total_score /= 3.0
        return total_score.round(1)
      end
end
