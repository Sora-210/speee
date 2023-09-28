# frozen_string_literal: true

RSpec.describe 'Assessments', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
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

      it 'creates a new assessment' do
        expect do
          post assessments_path, params: { assessment: valid_params }
        end.to change(Assessment, :count).by(1)
      end

      it 'redirects to the thanks page if external API responds with 200' do
        post assessments_path, params: { assessment: valid_params }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(action: :thanks)
      end
    end

    context 'when branch_id is missing' do
      let(:invalid_params) do
        {
          prefecture_id: 13,
          city_id: 708,
          branch_id: '',
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

      it 'does not create a new assessment' do
        expect do
          post assessments_path, params: { assessment: invalid_params }
        end.not_to change(Assessment, :count)
      end

      it 'redirects to the thanks page if external API responds with 422' do
        post assessments_path, params: { assessment: invalid_params }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(action: :error)
      end
    end
  end
end
