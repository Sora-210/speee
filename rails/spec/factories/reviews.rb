# frozen_string_literal: true

FactoryBot.define do
  factory :reviews, class: 'Review' do
    id { 1 }
    branch_id { 1 }
    prefecture_id { 13 }
    city_id { 708 }
    name { '服部 彩' }
    gender { 1 }
    age { 46 }
    address { '品川2丁目' }
    building_type { 0 }
    times_type { 0 }
    consider_season { '2018-02-14' }
    assessment_season { '2018-03-14' }
    po_season { '2018-03-14' }
    sale_season { '2019-01-14' }
    delivery_season { '2019-07-31' }
    speed_cs { 4 }
    assessment_price { 22_000_000 }
    sale_price { 22_500_000 }
    is_price_down { 1 }
    price_down_month { 3 }
    price_down_amount { 500_000 }
    close_price { 17_000_000 }
    price_cs { 2 }
    contract_type { 1 }
    title { '港区：担当者の対応が良かったです。' }
    sale_reason_type { 4 }
    anxiety do
      '港区品川：山路（やまみち）を登りながら、こう考えた。知に働けば角が立つ。情に棹させば流される。意地を通せば窮屈だ。とかくに人の世は住みにくい。↵住みにくさが高じると、安いところへ引き越したくなる。どこへ越しても住みにくいと悟った時、詩が生まれて、画ができる。'
    end
    decision_reason do
      '港区品川：吾輩は猫である。名前はまだ無い。どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事↵だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれ'
    end
    support_cs { 5 }
    support_reason do
      '港区品川：恥の多い生涯を送って来ました。自分には、人間の生活というものが、見当つかないのです。↵自分は東北の田舎に生れましたので、汽車をはじめて見たのは、よほど大きくなってからでした。自分は停車場のブリッジを、上'
    end
    advice { '港区品川：木曾路はすべて山の中である。↵あるところは岨づたいに' }
    is_public { 1 }
  end
end
