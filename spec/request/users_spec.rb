require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET/index' do
    it 'Response status is 200' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'Renders the index view template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'Rendered view includes correct placeholder text' do
      get users_path
      expect(response.body).to include('Users index view')
    end

    it 'Returns http succes' do
      get '/users/id'
      expect(response).to have_http_status(:success)
    end

    it 'Renders template with correct text' do
      get '/users'
      expect(response.body).to include('Users index view')
    end

    it 'Renders template index' do
      get '/users'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET/show' do
    it 'Response status is ok' do
      get users_path(1)
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the show view' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it 'Renders template with correct text' do
      get '/users/1/posts/1'
      expect(response.body).to include('Posts show view')
    end
  end
end
