# frozen_string_literal: true

FactoryBot.define do
  factory :branches, class: 'Branch' do
    id { 1 }
    company_id { 1 }
    prefecture_id { 13 }
    city_id { 708 }
    name { '品川支店' }
    logo_url { 'https://foodslink.jp/syokuzaihyakka/syun/fruit/abricotto/anzu21s.jpg' }
    post_code { '329-1224' }
    address { '品川2丁目' }
    tel { '03-0000-0000' }
    fax { '03-0000-0000' }
    business_hours_text { '平日9:00～18:00' }
    holidays_text { '水曜日、祝日、GW、他' }
    catchcopy { '不動産の売却はSpeee1不動産にお任せください' }
    introduction { 'Speee1不動産品川支店にお任せください！東京都港区の不動産売却の実績多数です。' }
  end
end
