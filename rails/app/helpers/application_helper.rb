# frozen_string_literal: true

module ApplicationHelper
  def price_in_millions_with_delimiter(price)
    number_with_delimiter(price / 10_000)
  end
end
