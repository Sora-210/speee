# frozen_string_literal: true

FactoryBot.define do
  factory :prefectures, class: 'Prefecture' do
    id { 13 }
    name { '東京都' }
  end
end
