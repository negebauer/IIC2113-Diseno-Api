require 'rails_helper'

RSpec.describe ExperiencesController, type: :controller do
  let(:valid_experience_attributes) do
    {
      name: 'Mi experiencia', description: 'La descripción de mi experiencia.', date: '2017-10-23 13:00:10 -0300'
    }
  end
  let(:not_valid_experience_attributes) do
    {
      description: 'La descripción de mi experiencia.', date: '2017-10-23 13:00:10 -0300'
    }
  end
  let(:valid_user_attributes) do
    {
      name: 'Frank', mail: 'frank@uc.cl', password: '123123', password_confirmation: '123123'
    }
  end
  let(:other_valid_user_attributes) do
    {
      name: 'Oscar', mail: 'orri@uc.cl', password: '123123', password_confirmation: '123123'
    }
  end

  context 'with authentication' do
    before(:each) do
      user = User.create! valid_user_attributes
      allow(controller).to receive_messages(authenticate_token: user)
    end

    describe 'GET #index' do
      it 'returns a success response' do
        get :index
        expect(response.status).to eq(200)
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        experience = Experience.create! valid_experience_attributes
        get :show, params: { id: experience.to_param }
        expect(response).to be_success
      end

      it 'returns a single experience' do
        experience = Experience.create! valid_experience_attributes
        get :show, params: { id: experience.to_param }
        json = JSON.parse(response.body)
        expect(json['id'].to_s).to eq(experience.to_param)
      end
    end

    describe 'POST #create' do
      it 'creates a new Experience' do
        expect do
          post :create, params: { experience: valid_experience_attributes }, format: :json
        end.to change(Experience, :count).by(1)
      end

      it 'returns a unprocessable_entity response' do
        post :create, params: { experience: not_valid_experience_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end

    describe 'PUT #update' do
      let(:valid_new_attributes) do
        { name: 'Mi super experiencia' }
      end

      it 'updates the requested experience' do
        experience = Experience.create! valid_experience_attributes
        put :update, params: { id: experience.to_param, experience: valid_new_attributes }, format: :json
        experience.reload
        expect(experience.name).to eq('Mi super experiencia')
      end
    end

    describe 'PUT #update' do
      let(:not_valid_new_attributes) do
        { name: '' }
      end

      it 'fails updating the requested experience' do
        experience = Experience.create! valid_experience_attributes
        put :update, params: { id: experience.to_param, experience: not_valid_new_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    describe 'POST #invite' do
      it 'invites a user to the experience' do
        experience = Experience.create! valid_experience_attributes
        other_user = User.create! other_valid_user_attributes
        post :invite, params: { id: experience.id, user_mail: other_user.mail }, format: :json
        json = JSON.parse(response.body)
        expect(json['users']).to include('mail' => other_user.mail, 'name' => other_user.name)
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested experience' do
        experience = Experience.create! valid_experience_attributes
        expect do
          delete :destroy, params: { id: experience.to_param }, format: :json
        end.to change(Experience, :count).by(-1)
      end
    end
  end

  context 'without authentication' do
    describe 'GET #index' do
      it 'returns a forbidden response' do
        get :index
        expect(response.status).to eq(403)
      end
    end

    describe 'POST #create' do
      it 'returns a forbidden response' do
        post :create, params: { experience: valid_experience_attributes }
        expect(response).to have_http_status(:forbidden)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
