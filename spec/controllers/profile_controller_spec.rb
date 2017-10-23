require 'rails_helper'

RSpec.describe ProfileController, type: :controller do
  let(:valid_attributes) do
    {
      name: 'Frank', mail: 'fnmendez123123@uc.cl', password: '123123', password_confirmation: '123123'
    }
  end

  describe 'GET #index' do
    it 'returns forbidden status' do
      get :index
      expect(response).to have_http_status(:forbidden)
    end

    it 'return the requested user and success status' do
      user = User.create! valid_attributes
      allow(controller).to receive_messages(authenticate_token: user)
      get :index
      json = JSON.parse(response.body)
      expect(json['id']).to eq(user.id)
      expect(response).to be_success
    end

    it 'authenticate the user correctly' do
      user = User.create! valid_attributes
      request.headers['Authorization'] = "Token #{user.token}"
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
