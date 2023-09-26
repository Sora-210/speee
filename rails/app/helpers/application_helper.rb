# frozen_string_literal: true

module ApplicationHelper
    def two_decimal_avg(value)
        value.round(2)
    end
    def price_in_millions_with_delimiter(price)
        number_with_delimiter(price / 10000)
      end
end
