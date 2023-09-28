# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Assessments' do
  describe '[GET] /assessments?branch_id=1', type: :request do
    let!(:prefecture) do
      create(:prefectures)
    end
    let!(:city) do
      create(:cities)
    end
    let!(:company) do
      create(:companies)
    end
    let!(:branch) do
      create(:branches)
    end

    it 'returns http success' do
      get assessments_path(branch_id: 1)
      expect(response).to have_http_status(:success)
    end
  end
end
