# frozen_string_literal: true

class Prefecture < ApplicationRecord
  has_many :cities, dependent: :restrict_with_error
  has_many :branches, dependent: :restrict_with_error
  has_many :reviews, dependent: :restrict_with_error
  has_many :assesments, dependent: :restrict_with_error
end
