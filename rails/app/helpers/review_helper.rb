# app/helpers/reviews_helper.rb
module ReviewHelper
    def display_sale_reason(sale_reason_type)
      reasons = {
        "moving_house" => "住み替え",
        "inheritance" => "相続",
        "transfer_job" => "転勤、転職",
        "divorce" => "離婚",
        "assets" => "資産整理",
        "money" => "金銭的な理由",
        "other" => "その他"
      }
  
      reasons[sale_reason_type]
    end
  end
  
