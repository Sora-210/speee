class Branch < ApplicationRecord
    belongs_to :company
    belongs_to :prefecture
    belongs_to :city
    has_many :assesment_areas
    has_many :reviews
    has_many :assesments
    def all_average_score
        total_score = (speed_average_score + price_average_score + support_cs_average_score) / 3
        return total_score.round(1)
      end
      def speed_average_score
        target_reviews = reviews
        score = target_reviews.average(:speed_cs).to_f
        return score.round(1)
      end
      def price_average_score
        target_reviews = reviews
        score = target_reviews.average(:price_cs).to_f
        return score.round(1)
      end
      def support_average_score
        target_reviews = reviews
        score = target_reviews.average(:support_cs).to_f
        return score.round(1)
      end
end
