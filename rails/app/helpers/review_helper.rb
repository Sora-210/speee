# app/helpers/reviews_helper.rb
module ReviewHelper
  def create_keywords(branch)
    "不動産会社,#{branch.company.name},#{branch.name.blank? ? "," : "#{branch.name}," }口コミ,評判"
  end
  def display_sale_reason(sale_reason_type)
    I18n.t("activerecord.attributes.review.sale_reasons.#{sale_reason_type}")
  end
  def format_japanese_date(date)
    date.strftime("%Y年%-m月")
  end
end
  
