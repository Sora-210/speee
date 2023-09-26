class City < ApplicationRecord
    belongs_to :prefecture
    has_many :assesment_areas
    has_many :branches
    has_many :reviews
    has_many :assesments
    def calculate_prefecture_branch_ids_duplicate_ids
        prefecture_branch_ids = prefecture.branches.pluck(:id)
        city_branch_ids = branches.pluck(:id)
        duplicate_ids = prefecture_branch_ids & city_branch_ids
        prefecture_branch_ids_count = prefecture_branch_ids.count
        duplicate_ids_count = duplicate_ids.count
        return { prefecture_branch_ids_count: prefecture_branch_ids_count, duplicate_ids_count: duplicate_ids_count}
    end
end
