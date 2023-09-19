class City < ApplicationRecord
    belongs_to :prefecture
    has_many :assesment_areas
end
