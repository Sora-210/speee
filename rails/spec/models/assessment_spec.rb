# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Assessment do
  before do
    create(:prefectures)
    create(:cities)
    create(:companies)
    create(:branches)
  end

  let(:valid_params) do
    {
      prefecture_id: 13,
      city_id: 708,
      branch_id: 1,
      last_name: '山田',
      first_name: '太郎',
      last_name_kana: 'ヤマダ',
      first_name_kana: 'タロウ',
      tel: '080-5099-9145',
      email: 'test@example.com',
      address: '東京都渋谷区',
      building_type: 'apartment_house',
      exclusive_area: 1,
      land_area: 1,
      building_area: 1,
      room_plan_type: 'k2',
      constructed_year: 10
    }
  end

  describe 'validations' do
    subject(:assessment) { described_class.new(valid_params) }

    context 'with valid attributes' do
      it 'is valid' do
        expect(assessment).to be_valid
      end
    end

    context 'email validations' do
      it 'is invalid without an email' do
        assessment.email = nil
        expect(assessment).not_to be_valid
      end

      it 'is invalid with a wrong format email' do
        assessment.email = 'a.com'
        expect(assessment).not_to be_valid
      end
    end

    context 'tel validations' do
      it 'is invalid without a tel' do
        assessment.tel = nil
        expect(assessment).not_to be_valid
      end

      it 'is invalid with a wrong format tel' do
        assessment.tel = '08-122-11'
        expect(assessment).not_to be_valid
      end
    end
  end
end
