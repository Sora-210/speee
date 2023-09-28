require 'rails_helper'

RSpec.feature "Branches", type: :request do
    describe '[GET] /branches/1' do
        it 'returns http success' do
            get branch_path(1)
            expect(response).to have_http_status(:success)
        end
    end
end