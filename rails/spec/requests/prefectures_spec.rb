# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Prefectures' do
  describe '[GET] /prefectures/東京都' do
    it 'returns http success' do
      get prefecture_path('東京都')
      expect(response).to have_http_status(:success)
    end
  end
end
