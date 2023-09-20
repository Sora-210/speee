class Branch < ApplicationRecord
    belongs_to :company
    belongs_to :prefecture
    belongs_to :city
    has_many :assesment_areas
    has_many :assesments
end
