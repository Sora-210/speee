class Branch < ApplicationRecord
    belongs_to :company
    has_many :audit_areas
end
