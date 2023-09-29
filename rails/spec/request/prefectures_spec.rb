# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Prefectures' do
  describe '[GET] /prefectures/東京都', type: :request do
    before do
      create(:prefectures)
      create(:cities)
      create(:companies)
      create(:branches)
      create(:assessment_areas)
    end

    it 'returns http success' do
      get prefecture_path('東京都')
      expect(response).to have_http_status(:success)
    end
  end
end
