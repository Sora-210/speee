# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities' do
  describe '[GET] /prefectures/東京都/cities/港区', type: :request do
    before do
      create(:prefectures)
      create(:cities)
      create(:companies)
      create(:branches)
    end

    it 'returns http success' do
      get prefecture_city_path('東京都', '港区')
      expect(response).to have_http_status(:success)
    end
  end
end
