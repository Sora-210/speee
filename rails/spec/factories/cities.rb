# frozen_string_literal: true

FactoryBot.define do
  factory :cities, class: 'City' do
    id { 708 }
    prefecture_id { 13 }
    name { '港区' }
    yomi { 'ミナトク' }
  end
end
