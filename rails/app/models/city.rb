# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :assessment_areas, dependent: :destroy
  has_many :branches, dependent: :restrict_with_exception
  has_many :reviews, dependent: :nullify
  has_many :assessments, dependent: :restrict_with_exception
  def no_index?
    prefecture_branch_ids = Branch.joins(assessment_areas: :city).where(assessment_areas: { cities: { prefecture_id: prefecture_id } }).distinct.pluck(:id)
    city_branch_ids = Branch.joins(:assessment_areas).where(assessment_areas: { city_id: id }).pluck(:id)
    duplicate_ids = prefecture_branch_ids & city_branch_ids
    prefecture_branch_ids_count = prefecture_branch_ids.count
    duplicate_ids_count = duplicate_ids.count
    return true if prefecture_branch_ids_count * 0.8 <= duplicate_ids_count

    false
  end
end
