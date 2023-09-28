# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Branches' do
  describe '[GET] /branches/1', type: :request do
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
      get branch_path(1)
      expect(response).to have_http_status(:success)
    end
  end
end
