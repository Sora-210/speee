class City < ApplicationRecord
    belongs_to :prefecture
    has_many :assesment_areas
    has_many :branches
    has_many :reviews
    has_many :assesments
    def no_index?
        prefecture_branch_ids = prefecture.branches.pluck(:id)
        city_branch_ids = branches.pluck(:id)
        duplicate_ids = prefecture_branch_ids & city_branch_ids
        prefecture_branch_ids_count = prefecture_branch_ids.count
        duplicate_ids_count = duplicate_ids.count
        if prefecture_branch_ids_count * 0.8 <= duplicate_ids_count
            return true
        else
            return false
        end
    end
end
