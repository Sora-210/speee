# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Assessments' do
  describe '[GET] /assessments?branch_id=1' do
    it 'returns http success' do
      get assessments_path(branch_id: 1)
      expect(response).to have_http_status(:success)
    end
  end
end
