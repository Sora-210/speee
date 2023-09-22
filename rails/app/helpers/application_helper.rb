# frozen_string_literal: true

module ApplicationHelper
    def rounded_avg(value)
        value.round(2)
    end
    def format_close_price(price)
        number_with_delimiter(price / 10000)
      end
end
