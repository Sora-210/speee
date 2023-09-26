# app/helpers/reviews_helper.rb
module ReviewHelper
  def display_sale_reason(sale_reason_type)
    I18n.t("activerecord.attributes.review.sale_reasons.#{sale_reason_type}")
  end
  def format_japanese_date(date)
    date.strftime("%Y年%-m月")
  end
end
