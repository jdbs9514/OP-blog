require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET/id' do
    it 'Returns http succes' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the index view' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end

    it 'Render the index view template' do
      get '/users/:user_id/posts'
      expect(response.body).to include('Post index view')
    end
  end

  describe 'GET/show' do
    it 'Response status is correct' do
      get '/users/:user_id/posts/1'
      expect(response).to have_http_status(200)
    end

    it 'Response to render show view' do
      get '/users/:user_id/posts/1'
      expect(response).to render_template(:show)
    end

    it 'Response to render show view template' do
      get '/users/:user_id/posts/1'
      expect(response.body).to include('Posts show view')
    end
  end
end
