require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:valid_user_attributes) do
    {
      name: 'Frank', mail: 'frank@uc.cl', password: '123123', password_confirmation: '123123'
    }
  end
  let(:login_params) do
    { mail: 'frank@uc.cl', password: '123123' }
  end
  let(:bad_login_params) do
    { mail: 'frank@uc.cl', password: 'abcdef' }
  end

  before(:each) do
    User.create! valid_user_attributes
  end

  describe 'POST #create' do
    it 'logins correctly' do
      post :create, params: login_params, format: :json
      expect(response).to have_http_status(:success)
    end

    it 'fails to login' do
      post :create, params: bad_login_params, format: :json
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'POST #destroy' do
    it 'logout correctly' do
      user = User.create! valid_user_attributes
      allow(controller).to receive_messages(authenticate_token: user)
      post :destroy
      expect(response).to have_http_status(:success)
    end
  end
end
