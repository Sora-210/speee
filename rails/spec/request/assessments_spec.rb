# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Assessments' do
  describe '[GET] /assessments', type: :request do
    before do
      create(:prefectures)
      create(:cities)
      create(:companies)
      create(:branches)
    end

    context 'branch_idがあるとき' do
      it '200になること' do
        get assessments_path(branch_id: 1)
        expect(response).to have_http_status(:success)
      end
    end

    context 'branch_idがないとき' do
      it '404になること' do
        get assessments_path
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
