require 'rails_helper'
require 'cgi'

RSpec.feature "Assessments", type: :request do
    describe '[GET] /assessments?branch_id=1' do
        it 'returns http success' do
            get assessments_path(branch_id: 1)
            expect(response).to have_http_status(:success)
        end
    end
end