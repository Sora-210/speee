require 'rails_helper'
require 'cgi'

RSpec.feature "Reviews", type: :request do
    describe '[GET] /reviews/1' do
        it 'returns http success' do
            get review_path(1)
            expect(response).to have_http_status(:success)
        end
    end
end