# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Prefectures' do
  describe '[GET] /prefectures/東京都', type: :request do
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
      get prefecture_path('東京都')
      expect(response).to have_http_status(:success)
    end
  end
end
