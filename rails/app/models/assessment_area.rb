# frozen_string_literal: true

class AssessmentArea < ApplicationRecord
  belongs_to :branch
  belongs_to :city
end
