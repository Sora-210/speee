# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :branches, dependent: :restrict_with_exception
end
