# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews' do
  describe '[GET] /reviews/1', type: :request do
    before do
      create(:prefectures)
      create(:cities)
      create(:companies)
      create(:branches)
      create(:reviews)
    end

    it 'returns http success' do
      get review_path(1)
      expect(response).to have_http_status(:success)
    end
  end
end
