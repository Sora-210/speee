# frozen_string_literal: true

FactoryBot.define do
  factory :assessment_areas, class: 'AssessmentArea' do
    id { 1 }
    branch_id { 1 }
    city_id { 708 }
  end
end
