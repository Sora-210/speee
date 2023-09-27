# frozen_string_literal: true

class Prefecture < ApplicationRecord
  has_many :cities
  has_many :branches
  has_many :reviews
  has_many :assesments
end
