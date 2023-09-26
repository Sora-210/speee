# app/helpers/reviews_helper.rb
module ReviewHelper
  def create_title(review)
    "（#{review.created_at.strftime("%Y年%-m月")}投稿）口コミ・評判 | #{review.branch.company.name}#{review.branch.name}"
  end
  def display_sale_reason(sale_reason_type)
    I18n.t("activerecord.attributes.review.sale_reasons.#{sale_reason_type}")
  end
  def format_japanese_date(date)
    date.strftime("%Y年%-m月")
  end
end
