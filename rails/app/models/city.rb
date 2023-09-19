class City < ApplicationRecord
    belongs_to :prefecture
    has_many :audit_areas
end
