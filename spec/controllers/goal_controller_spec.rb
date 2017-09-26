require 'rails_helper'

RSpec.describe GoalController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end
  end
end
