require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    {
      name: 'Frank', mail: 'fnmendez123123@uc.cl', password: '123123', password_confirmation: '123123'
    }
  end
  let(:other_valid_attributes) do
    {
      name: 'Osk', mail: 'orri@uc.cl', password: '123123', password_confirmation: '123123'
    }
  end
  let(:invalid_attributes) do
    {
      mail: 'frank@uc.cl', password: '123123', password_confirmation: '123123'
    }
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, params: valid_attributes, format: :json
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new user' do
        post :create, params: { user: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect do
        delete :destroy, params: { id: user.to_param }, format: :json
      end.to change(User, :count).by(-1)
    end
  end
end
