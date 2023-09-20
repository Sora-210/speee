class City < ApplicationRecord
    belongs_to :prefecture
    has_many :assesment_areas
    has_many :branches
    has_many :reviews
    has_many :assesments
end
