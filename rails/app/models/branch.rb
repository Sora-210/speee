class Branch < ApplicationRecord
    belongs_to :company
    has_many :assesment_areas
end
