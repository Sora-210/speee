# frozen_string_literal: true

class AssesmentArea < ApplicationRecord
  belongs_to :branch
  belongs_to :city
end
